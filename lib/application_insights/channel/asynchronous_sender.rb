require_relative 'sender_base'
require 'thread'

module ApplicationInsights
  module Channel
    # An asynchronous sender that works in conjunction with the {AsynchronousQueue}. The sender object will start a
    # worker thread that will pull items from the {#queue}. The thread will be created when the client calls {#start} and
    # will check for queue items every {#send_interval} seconds. The worker thread can also be forced to check the queue
    # by setting the {AsynchronousQueue#flush_notification} event.
    #
    # - If no items are found, the thread will go back to sleep.
    # - If items are found, the worker thread will send items to the specified service in batches of {#send_buffer_size}.
    #
    # If no queue items are found for {#send_time} seconds,  the worker thread will shut down (and {#start} will
    # need  to be called again).
    class AsynchronousSender < SenderBase
      # Initializes a new instance of the class.
      # @param [String] service_endpoint_uri the address of the service to send telemetry data to.
      def initialize(service_endpoint_uri='https://dc.services.visualstudio.com/v2/track')
        @send_interval = 1.0
        @send_remaining_time = 0
        @send_time = 3.0
        @lock_send_remaining_time = Mutex.new
        super service_endpoint_uri
      end

      # The time span in seconds at which the the worker thread will check the {#queue} for items (defaults to: 1.0).
      # @return [Fixnum] the interval in seconds.
      attr_accessor :send_interval

      # The time span in seconds for which the worker thread will stay alive if no items are found in the {#queue} (defaults to 3.0).
      # @return [Fixnum] the interval in seconds.
      attr_accessor :send_time

      # Calling this method will create a worker thread that checks the {#queue} every {#send_interval} seconds for
      # a total duration of {#send_time} seconds for new items. If a worker thread has already been created, calling
      # this method does nothing.
      def start
        @lock_send_remaining_time.synchronize do
          if @send_remaining_time <= 0
            local_send_interval = (@send_interval < 0.1) ? 0.1 : @send_interval
            @send_remaining_time = (@send_time < local_send_interval) ? local_send_interval : @send_time
            thread = Thread.new do
              run
            end
            thread.abort_on_exception = false
          end
        end
      end

      # Calling this method will shut down the worker thread that checks the {#queue} for new items. The thread will be
      # allowed to shut down gracefully.
      def stop
        @lock_send_remaining_time.synchronize do
          @send_remaining_time = 0
        end
      end

      private

      def run
        # save the queue locally
        local_queue = @queue
        if local_queue == nil
          stop
          return
        end

        # fix up the send interval (can't be lower than 100ms)
        local_send_interval = (@send_interval < 0.1) ? 0.1 : @send_interval
        while TRUE
          while TRUE
            # get at most @send_buffer_size items from the queue
            counter = @send_buffer_size
            data = []
            while counter > 0
              item = local_queue.pop
              break if not item
              data.push item
              counter -= 1
            end

            # if we didn't get any items from the queue, we're done here
            break if data.length == 0

            # reset the send time
            @lock_send_remaining_time.synchronize do
              @send_remaining_time = @send_time
            end

            # finally send the data
            send data
          end

          # wait at most @send_interval ms (or until we get signalled)
          result = local_queue.flush_notification.wait local_send_interval
          if result
            local_queue.flush_notification.clear
            next
          end

          local_remaining_time = 0
          # decrement the remaining time
          @lock_send_remaining_time.synchronize do
            @send_remaining_time -= local_send_interval
            local_remaining_time = @send_remaining_time
          end

          if local_remaining_time <= 0
            break
          end
        end
      end
    end
  end
end