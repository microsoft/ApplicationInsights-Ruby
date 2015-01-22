require 'rack'
require 'securerandom'
require_relative '../channel/contracts/request_data'
require_relative '../telemetry_client'

module ApplicationInsights
  class TrackRequest
    def initialize(app, instrumentation_key, sender = nil)
      @app = app
      @instrumentation_key = instrumentation_key
      @sender = sender
    end

    def call(env)
      start = Time.now
      @status, @headers, @response = @app.call(env)
      stop = Time.now

      if !@client
        sender = @sender || ApplicationInsights::Channel::AsynchronousSender.new
        queue = ApplicationInsights::Channel::AsynchronousQueue.new sender
        channel = ApplicationInsights::Channel::TelemetryChannel.new nil, queue
        @client = TelemetryClient.new channel
        @client.context.instrumentation_key = @instrumentation_key
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