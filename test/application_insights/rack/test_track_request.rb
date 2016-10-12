require 'test/unit'
require 'rack/mock'
require_relative '../mock_sender'
require_relative '../../../lib/application_insights/rack/track_request'

include ApplicationInsights::Rack

class TestTrackRequest < Test::Unit::TestCase
  def test_call_works_as_expected
    response_code = rand(200..204)
    app = Proc.new {|env| sleep(2); [response_code, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    url = "http://localhost:8080/foo?a=b"
    http_method = 'PUT'
    env = Rack::MockRequest.env_for(url, :method => http_method)
    instrumentation_key = 'key'
    sender = MockAsynchronousSender.new
    track_request = TrackRequest.new app, instrumentation_key, 500, 1
    track_request.send(:sender=, sender)
    start_time = Time.now
    result = track_request.call(env)
    assert_equal app.call(env), result
    sleep(sender.send_interval)

    assert_equal 1, sender.buffer.count
    payload = sender.buffer[0]
    assert_equal instrumentation_key, payload[0].i_key

    request_data = payload[0].data.base_data
    assert_equal "#{http_method} /foo", request_data.name
    assert_equal response_code, request_data.response_code
    assert_equal true, request_data.success
    assert_equal http_method, request_data.http_method
    assert_equal url, request_data.url
    assert_equal true, request_data.duration.start_with?("0:00:00:02")
    assert Time.parse(request_data.start_time) - start_time < 0.01
  end

  def test_call_with_failed_request
    response_code = rand(400..600)
    app = Proc.new {|env| [response_code, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    url = "http://localhost:8080/foo"
    http_method = 'PUT'
    env = Rack::MockRequest.env_for(url, :method => http_method)
    instrumentation_key = 'key'
    sender = MockAsynchronousSender.new
    track_request = TrackRequest.new app, instrumentation_key, 500, 1
    track_request.send(:sender=, sender)
    track_request.call(env)
    sleep(sender.send_interval)

    payload = sender.buffer[0]
    request_data = payload[0].data.base_data
    assert_equal false, request_data.success
  end

  def test_call_with_unhandled_exception
    app = Proc.new {|env| raise StandardError, 'Boom!'}
    env = Rack::MockRequest.env_for( "http://localhost:8080/foo", :method => "GET")
    instrumentation_key = 'key'
    sender = MockAsynchronousSender.new
    track_request = TrackRequest.new app, instrumentation_key, 500, 1
    track_request.send(:sender=, sender)
    
    begin
      track_request.call(env)
    rescue => ex
      assert_equal 'Boom!', ex.message
    end
    
    sleep(sender.send_interval)
    payload = sender.buffer[0]
    assert_equal 2, payload.count
    request_data = payload[0].data.base_data
    assert_equal false, request_data.success
    assert_equal 500, request_data.response_code

    exception_data = payload[1].data.base_data
    assert_equal instrumentation_key, payload[1].i_key
    assert_equal 'Unhandled', exception_data.handled_at
  end

  def test_internal_client
    app = Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    env = Rack::MockRequest.env_for('http://localhost:8080/foo', :method => "GET")
    buffer_size = 30
    send_interval = 5
    track_request = TrackRequest.new app, 'key', buffer_size, send_interval
    client = track_request.send(:client)
    # test lazy initialization
    assert_nil client

    track_request.call(env)
    client = track_request.send(:client)
    channel = client.channel
    assert_equal buffer_size, channel.queue.max_queue_length
    assert_equal send_interval, channel.sender.send_interval

    track_request.call(env)
    client2 = track_request.send(:client)
    channel2 = client2.channel
    assert_same client, client2
    assert_same channel, channel2
  end

  def test_format_request_duration_less_than_a_day
    app = Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    track_request = TrackRequest.new app, 'one'
    duration_seconds = rand(86400) + rand
    time_span = track_request.send(:format_request_duration, duration_seconds)
    time_span_format = /^(?<day>\d{1}):(?<hour>\d{2}):(?<minute>\d{2}):(?<second>\d{2}).(?<fraction>\d{7})$/
    match = time_span_format.match time_span
    assert_not_nil match
    days = duration_seconds.to_i/86400
    assert_equal days, match['day'].to_i
    hours = (duration_seconds - days * 86400).to_i/3600
    assert_equal hours, match['hour'].to_i
    minutes = (duration_seconds - days * 86400 - hours * 3600).to_i/60
    assert_equal minutes, match['minute'].to_i
    seconds = (duration_seconds - days * 86400 - hours * 3600 - minutes * 60).to_i
    assert_equal seconds, match['second'].to_i
    fraction = ((duration_seconds - duration_seconds.to_i) * 10 ** 7).to_i
    assert_equal fraction, match['fraction'].to_i
  end

  def test_format_request_duration_more_than_a_day
    app = Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    track_request = TrackRequest.new app, 'one'
    duration_seconds = rand(86400..240000) + rand
    time_span = track_request.send(:format_request_duration, duration_seconds)
    time_span_format = /^(?<day>\d{1}):(?<hour>\d{2}):(?<minute>\d{2}):(?<second>\d{2}).(?<fraction>\d{7})$/
    match = time_span_format.match time_span
    assert_not_nil match
    assert_equal 1, match['day'].to_i
    assert_equal 0, match['hour'].to_i
    assert_equal 0, match['minute'].to_i
    assert_equal 0, match['second'].to_i
    assert_equal 0, match['fraction'].to_i
  end
end
