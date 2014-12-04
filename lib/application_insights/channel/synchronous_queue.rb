require_relative 'queue_base'

module ApplicationInsights
  module Channel
    # A synchronous queue for use in conjunction with the SynchronousSender. The queue will flush either when it reaches max_queue_length or when someone calls flush().
    class SynchronousQueue < QueueBase
      # Initializes a new instance of the synchronous queue class.
      def initialize(sender)
        super sender
      end

      # Flushes the current queue to the passed in sender.
      def flush
        while TRUE
          # get at most send_buffer_size items and send them
          data = []
          while data.length < @sender.send_buffer_size
            item = pop()
            break if not item
            data.push item
          end
          break if data.length == 0
          @sender.send(data)
        end
      end
    end
  end
end