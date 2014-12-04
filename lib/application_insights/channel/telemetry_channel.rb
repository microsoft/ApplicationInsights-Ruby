require_relative 'telemetry_context'
require_relative 'synchronous_queue'
require_relative 'synchronous_sender'
require_relative 'contracts/envelope'
require_relative 'contracts/data'
require_relative 'contracts/internal'

module ApplicationInsights
  module Channel
    # The telemetry channel is responsible for constructing an envelope an sending it.
    class TelemetryChannel
      # Initializes a new instance of the telemetry channel class.
      def initialize(context=nil, queue=nil)
        @context = context || TelemetryContext.new
        @queue = queue || SynchronousQueue.new(SynchronousSender.new)
      end

      # Gets the context associated with this channel.
      attr_reader :context

      # Gets the queue associated with this channel.
      attr_reader :queue

      # Gets the sender associated with this channel.
      def sender
        @queue.sender
      end

      # Flushes the current queue.
      def flush
        @queue.flush
      end

      # Writes the passed in data to the sending queue.
      def write(data, context=nil)
        local_context = context || @context
        raise ArgumentError, 'Context was required but not provided' unless local_context
        data_type = data.class.name.gsub(/^.*::/, '')
        set_properties data, local_context
        data_attributes = {
            :base_type => data_type,
            :base_data => data
        }
        envelope_attributes = {
          :name => 'Microsoft.ApplicationInsights.' + data_type[0..-5],
          :time => Time.now.getutc.strftime('%FT%T.%6NZ'),
          :i_key => local_context.instrumentation_key,
          :tags => get_tags(local_context),
          :data => Contracts::Data.new(data_attributes)
        }
        envelope = Contracts::Envelope.new envelope_attributes
        @queue.push(envelope)
      end

      private

      def get_tags(context)
        hash = {}
        internal_context_attributes = {
          :sdk_version => 'rb:0.1.0'
        }
        internal_context = Contracts::Internal.new internal_context_attributes
        contexts = [ internal_context, context.application, context.device, context.user, context.session, context.location, context.operation ]
        contexts.each { |c|  hash.merge!(c.to_h) if c }
        hash
      end

      def set_properties(data, context)
        if context.properties
          properties = data.properties || {}
          context.properties.each do |key, value|
            unless properties.key?(key)
              properties[key] = value
            end
          end
          data.properties = properties
        end
      end
    end
  end
end