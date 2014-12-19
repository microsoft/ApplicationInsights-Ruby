require_relative 'queue_base'
require 'thread'

module ApplicationInsights
  module Channel
    # An event class that allows simple cross-thread signalling.
    #
    # An object of this type managers an internal flag that can be set to true via the {#set} method and reset via the
    # {#clear} method. Calling the {#wait} method will block until the flag is set to true.
    class Event
      # Initializes a new instance of the class.
      def initialize
        @mutex = Mutex.new
        @condition_variable = ConditionVariable.new
        @signal = false
      end

      # Sets the internal flag to true. Calling this method will also cause all waiting threads to awaken.
      def set
        @mutex.synchronize do
          @signal = true
          @condition_variable.broadcast
        end
      end

      # Sets the internal flag to false.
      def clear
        @mutex.synchronize do
          @signal = false
        end
      end

      # Calling this method will block until the internal flag is set to true. If the flag is set to true before calling
      # this method, we will return immediately. If the timeout parameter is specified, the method will unblock after the
      # specified number of milliseconds.
      # @param [Fixnum] timeout the timeout for the operation in milliseconds.
      # @return [Boolean] the value of the internal flag on exit.
      def wait(timeout=nil)
        @mutex.synchronize do
          if @signal == false
            @condition_variable.wait @mutex, (timeout == nil) ? nil : timeout / 1000.0
          end
          @signal
        end
      end
    end
  end
end