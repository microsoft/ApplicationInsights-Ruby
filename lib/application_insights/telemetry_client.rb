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
require_relative 'channel/contracts/stack_frame'
require_relative 'channel/contracts/request_data'

module ApplicationInsights
  # The telemetry client used for sending all types of telemetry. It serves as the main entry point for
  # interacting with the Application Insights service.
  class TelemetryClient
    # Initializes a new instance of the class.
    # @param [Channel::TelemetryChannel] telemetry_channel the optional telemetry channel to be used instead of
    #   constructing a default one.
    def initialize(telemetry_channel = nil)
      @context = Channel::TelemetryContext.new
      @channel = telemetry_channel || Channel::TelemetryChannel.new
    end

    # The context associated with this client. All data objects created by this client will be accompanied by
    # this value.
    # @return [Channel::TelemetryContext] the context instance.
    attr_reader :context

    # The channel associated with this telemetry client. All data created by this client will be passed along with
    # the {#context} object to {Channel::TelemetryChannel#write}
    # @return [Channel::TelemetryChannel] the channel instance.
    attr_reader :channel

    # Send information about the page viewed in the application (a web page for instance).
    # @param [String] name the name of the page that was viewed.
    # @param [String] url the URL of the page that was viewed.
    # @param [Hash] options the options to create the {Channel::Contracts::PageViewData} object.
    # @option options [Fixnum] :duration the duration of the page view in milliseconds. (defaults to: 0)
    # @option options [Hash] :properties the set of custom properties the client wants attached to this
    #   data item. (defaults to: {})
    # @option options [Hash] :measurements the set of custom measurements the client wants to attach to
    #   this data item (defaults to: {})
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

    # Send information about a single exception that occurred in the application.
    # @param [Exception] exception the exception that the client wants to send.
    # @param [Hash] options the options to create the {Channel::Contracts::ExceptionData} object.
    # @option options [String] :handled_at the type of exception (defaults to: 'UserCode')
    # @option options [Hash] :properties the set of custom properties the client wants attached to this
    #   data item. (defaults to: {})
    # @option options [Hash] :measurements the set of custom measurements the client wants to attach to
    #   this data item (defaults to: {})
    def track_exception(exception, options={})
      if exception.is_a? Exception
        parsed_stack = []
        if exception.backtrace
          frame_pattern = /^(?<file>.*):(?<line>\d+)(\.|:in `((?<method>.*)'$))/
          counter = 0;
          exception.backtrace.each do |frame|
            match = frame_pattern.match frame
            stack_frame = Channel::Contracts::StackFrame.new
            stack_frame.assembly = 'Unknown'
            stack_frame.file_name = match['file']
            stack_frame.level = counter
            stack_frame.line = match['line']
            stack_frame.method = match['method']
            parsed_stack << stack_frame
            counter += 1
          end
        end

        details_attributes = {
          :id => 1,
          :outer_id => 0,
          :type_name => exception.class,
          :message => exception.message,
          :has_full_stack => exception.backtrace != nil,
          :stack => (exception.backtrace.join("\n") if exception.backtrace),
          :parsed_stack => parsed_stack
        }
        details = Channel::Contracts::ExceptionDetails.new details_attributes

        data_attributes = {
          :handled_at => options.fetch(:handled_at,'UserCode'),
          :exceptions => [ details ],
          :properties => options.fetch(:properties) { {} },
          :measurements => options.fetch(:measurements) { {} }
        }
        data = Channel::Contracts::ExceptionData.new data_attributes
        self.channel.write(data, self.context)
      end
    end

    # Send information about a single event that has occurred in the context of the application.
    # @param [String] name the data to associate to this event.
    # @param [Hash] options the options to create the {Channel::Contracts::EventData} object.
    # @option options [Hash] :properties the set of custom properties the client wants attached to this
    #   data item. (defaults to: {})
    # @option options [Hash] :measurements the set of custom measurements the client wants to attach to
    #   this data item (defaults to: {})
    def track_event(name, options={})
      data_attributes = {
        :name => name || 'Null',
        :properties => options.fetch(:properties) { {} },
        :measurements => options.fetch(:measurements) { {} }
      }
      data = Channel::Contracts::EventData.new data_attributes
      self.channel.write(data, self.context)
    end

    # Send information about a single metric data point that was captured for the application.
    # @param [String] name the name of the metric that was captured.
    # @param [Fixnum] value the value of the metric that was captured.
    # @param [Hash] options the options to create the {Channel::Contracts::MetricData} object.
    # @option options [Channel::Contracts::DataPointType] :type the type of the metric (defaults to:
    #   {Channel::Contracts::DataPointType::AGGREGATION})
    # @option options [Fixnum] :count the number of metrics that were aggregated into this data point
    #   (defaults to: 0)
    # @option options [Fixnum] :min the minimum of all metrics collected that were aggregated into this
    #   data point (defaults to: 0)
    # @option options [Fixnum] :max the maximum of all metrics collected that were aggregated into this
    #   data point (defaults to: 0)
    # @option options [Fixnum] :std_dev the standard deviation of all metrics collected that were aggregated
    #   into this data point (defaults to: 0)
    # @option options [Hash] :properties the set of custom properties the client wants attached to this
    #   data item. (defaults to: {})
    # @option options [Hash] :measurements the set of custom measurements the client wants to attach to
    #   this data item (defaults to: {})
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
        :properties => options.fetch(:properties) { {} }
      }
      data = Channel::Contracts::MetricData.new data_attributes
      self.channel.write(data, self.context)
    end

    # Sends a single trace statement.
    # @param [String] name the trace statement.
    # @param [Hash] options the options to create the {Channel::Contracts::EventData} object.
    # @option options [Hash] :properties the set of custom properties the client wants attached to this
    #   data item. (defaults to: {})
    def track_trace(name, options={})
      data_attributes = {
          :message => name || 'Null',
          :properties => options.fetch(:properties) { {} }
      }
      data = Channel::Contracts::MessageData.new data_attributes
      self.channel.write(data, self.context)
    end

    # Sends a single request.
    # @param [String] id the unique identifier of the request.
    # @param (String) start_time the start time of the request.
    # @param [String] duration the duration to process the request.
    # @param [String] response_code the response code of the request.
    # @param [Boolean] success indicates whether the request succeeds or not.
    # @param [Hash] options the options to create the {Channel::Contracts::RequestData} object.
    # @option options [String] :name the name of the request.
    # @option options [String] :http_method the http method used for the request.
    # @option options [String] :url the url of the request.
    # @option options [Hash] :properties the set of custom properties the client wants attached to this
    #   data item. (defaults to: {})
    # @option options [Hash] :measurements the set of custom measurements the client wants to attach to
    #   this data item (defaults to: {})
    def track_request(id, start_time, duration, response_code, success, options={})
      data_attributes = {
          :id => id || 'Null',
          :start_time => start_time || Time.now.iso8601(7),
          :duration => duration || '0:00:00:00.0000000',
          :response_code => response_code || 200,
          :success => success = nil ? true : success,
          :name => options[:name],
          :http_method => options[:http_method],
          :url => options[:url],
          :properties => options.fetch(:properties) { {} },
          :measurements => options.fetch(:measurements) { {} }
      }
      data = Channel::Contracts::RequestData.new data_attributes
      self.channel.write(data, self.context)
    end

    # Flushes data in the queue. Data in the queue will be sent either immediately irrespective of what sender is
    # being used.
    def flush
      self.channel.flush
    end
  end
end
