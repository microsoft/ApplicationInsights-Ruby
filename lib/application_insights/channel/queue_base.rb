require 'thread'

module ApplicationInsights
  module Channel
    # The base class for all queues.
    class QueueBase
      # Initializes a new instance of the queue class.
      def initialize(sender)
        raise ArgumentError, 'Sender was required but not provided' unless sender
        @queue = Queue.new
        @max_queue_length = 500
        @sender = sender
        @sender.queue = self
      end

      # Gets or sets the maximum number of items that will be held by the queue before we force a send.
      attr_accessor :max_queue_length

      # Gets the sender associated with this queue
      attr_reader :sender

      # Adds a single item to the queue.
      def push(item)
        unless item
          return
        end

        @queue.push(item)
        if @queue.length >= @max_queue_length
          flush
        end
      end

      # Gets a single item from the queue. If no item is available, return nil.
      def pop
        begin
          return @queue.pop(TRUE)
        rescue ThreadError => _
          return nil
        end
      end

      # Flushes the current queue to the passed in sender.
      def flush
      end
    end
  end
end