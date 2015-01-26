require 'rack'
require 'securerandom'
require_relative '../channel/contracts/request_data'
require_relative '../telemetry_client'

module ApplicationInsights
  # Track every request and sends the request data to Application Insights.
  class TrackRequest
    # Initializes a new instance of the class.
    # @param [Object] app the inner rack application.
    # @param [String] instrumentation_key to identify which Application Insights application this data is for.
    # @param [Fixnum] buffer_size the buffer size (defaults to 500), the buffered requests would send to Application
    #   Insights when buffer is full.
    # @param [Fixnum] send_interval the frequency (in seconds) to check buffer and send buffered requests to Application
    #   Insights if any.
    def initialize(app, instrumentation_key, buffer_size=500, send_interval=60)
      @app = app
      @instrumentation_key = instrumentation_key
      @buffer_size = buffer_size
      @send_interval = send_interval
    end

    # Track requests and send data to Application Insights asynchronously.
    # @param [Hash] the rack environment.
    def call(env)
      start = Time.now
      @status, @headers, @response = @app.call(env)
      stop = Time.now

      if !@client
        sender = @sender || Channel::AsynchronousSender.new
        sender.send_interval = @send_interval
        queue = Channel::AsynchronousQueue.new sender
        queue.max_queue_length = @buffer_size
        channel = Channel::TelemetryChannel.new nil, queue
        @client = TelemetryClient.new  @instrumentation_key, channel
      end

      request = Rack::Request.new env
      id = rand(16**32).to_s(16)
      start_time = start.iso8601(7)
      duration = seconds_to_time_span(stop - start)
      success = @status.to_i < 400
      options = {
          :name => "#{request.request_method} #{request.path}",
          :http_method => request.request_method,
          :url => request.url
      }
      @client.track_request id, start_time, duration, @status, success, options

      [@status, @headers, @response]
    end

    private

    def sender=(sender)
      @sender = sender if sender.is_a? Channel::AsynchronousSender
    end

    def seconds_to_time_span(duration_seconds)
      total_seconds = duration_seconds.to_i
      seconds = total_seconds % 60
      minutes = (total_seconds / 60) % 60
      hours = (total_seconds / 3600) % 24
      days = total_seconds / (3600 * 24)
      ten_millionths_of_second = ((duration_seconds - duration_seconds.to_i) * 10 ** 7).to_i
      "%d:%02d:%02d:%02d.%07d" % [days, hours, minutes, seconds, ten_millionths_of_second]
    end
  end
end