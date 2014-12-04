require_relative 'channel/telemetry_context'
require_relative 'channel/telemetry_channel'
require_relative 'channel/contracts/page_view_data'
require_relative 'channel/contracts/exception_data'
require_relative 'channel/contracts/exception_details'
require_relative 'channel/contracts/event_data'
require_relative 'channel/contracts/data_point'
require_relative 'channel/contracts/data_point_type'
require_relative 'channel/contracts/metric_data'
require_relative 'channel/contracts/message_data'

module ApplicationInsights
  # The telemetry client used for sending all types of telemetry.
  class TelemetryClient
    # Initializes a new instance of the TelemetryClient class.
    def initialize(telemetry_channel = nil)
      @context = Channel::TelemetryContext.new
      @channel = telemetry_channel || Channel::TelemetryChannel.new
    end

    # Gets the context associated with this telemetry client.
    attr_reader :context

    # Gets the channel associated with this telemetry client.
    attr_reader :channel

    # Send information about the page viewed in the application.
    def track_page_view(name, url, options={})
      data_attributes = {
        :name => name || 'Null',
        :url => url,
        :duration => options[:duration],
        :properties => options.fetch(:properties) { {} },
        :measurements => options.fetch(:measurements) { {} }
      }
      data = Channel::Contracts::PageViewData.new data_attributes
      self.channel.write(data, self.context)
    end

    # Send an ExceptionTelemetry object for display in Diagnostic Search.
    def track_exception(exception, options={})
      if exception.is_a? Exception
        details_attributes = {
          :id => 1,
          :outer_id => 0,
          :type_name => exception.class,
          :message => exception.message,
          :has_full_stack => true,
          :stack => exception.backtrace.join("\n")
        }
        details = Channel::Contracts::ExceptionDetails.new details_attributes

        data_attributes = {
          :handled_at => 'UserCode',
          :exceptions => [ details ],
          :properties => options.fetch(:properties) { {} },
          :measurements => options.fetch(:measurements) { {} }
        }
        data = Channel::Contracts::ExceptionData.new data_attributes
        self.channel.write(data, self.context)
      end
    end

    # Send an EventTelemetry object for display in Diagnostic Search and aggregation in Metrics Explorer.
    def track_event(name, options={})
      data_attributes = {
        :name => name || 'Null',
        :properties => options.fetch(:properties) { {} },
        :measurements => options.fetch(:measurements) { {} }
      }
      data = Channel::Contracts::EventData.new data_attributes
      self.channel.write(data, self.context)
    end

    # Send a MetricTelemetry object for aggregation in Metric Explorer.
    def track_metric(name, value, options={})
      data_point_attributes = {
        :name => name || 'Null',
        :value => value || 0,
        :kind => options.fetch(:type) { Channel::Contracts::DataPointType::AGGREGATION },
        :count => options[:count],
        :min => options[:min],
        :max => options[:max],
        :std_dev => options[:std_dev]
      }
      data_point = Channel::Contracts::DataPoint.new data_point_attributes

      data_attributes = {
        :metrics => [ data_point ],
        :properties => options.fetch(:measurements) { {} }
      }
      data = Channel::Contracts::MetricData.new data_attributes
      self.channel.write(data, self.context)
    end

    # Send a trace message for display in Diagnostic Search.
    def track_trace(name, options={})
      data_attributes = {
        :message => name || 'Null',
        :properties => options.fetch(:measurements) { {} }
      }
      data = Channel::Contracts::MessageData.new data_attributes
      self.channel.write(data, self.context)
    end

    # Flushes the current queue.
    def flush
      self.channel.flush
    end
  end
end
