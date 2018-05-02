require 'test/unit'
require 'mocha/test_unit'
require 'rack/mock'
require_relative '../mock_sender'
require_relative '../../../lib/application_insights/rack/track_request'

include ApplicationInsights::Rack

class TestTrackRequest < Test::Unit::TestCase

  TIME_SPAN_FORMAT = /^(?<day>\d{2})\.(?<hour>\d{2}):(?<minute>\d{2}):(?<second>\d{2}).(?<fraction>\d{7})$/

  def test_call_works_as_expected
    response_code = rand(200..204)
    app = Proc.new {|env| sleep(2.5); [response_code, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    url = "http://localhost:8080/foo?a=b"
    http_method = 'PUT'
    env = Rack::MockRequest.env_for(url, :method => http_method)
    instrumentation_key = 'key'
    sender = MockAsynchronousSender.new
    track_request = TrackRequest.new app, instrumentation_key, 500, 1
    track_request.send(:sender=, sender)
    start_time = Time.now

    SecureRandom.expects(:base64).with(10).returns('y0NM2eOY/fnQPw==')
    result = track_request.call(env)

    app_result = app.call(env)
    assert_equal app_result, result
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
    assert_equal true, request_data.duration.start_with?("00.00:00:02")
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
    # test client initialization
    assert_equal ApplicationInsights::TelemetryClient, client.class

    track_request.call(env)
    client = track_request.send(:client)
    channel = client.channel
    assert_equal buffer_size, channel.queue.max_queue_length
    assert_equal send_interval, channel.sender.send_interval
  end

  def test_format_request_duration_less_than_a_day
    app = Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    track_request = TrackRequest.new app, 'one'
    duration_seconds = rand(86400) + rand
    time_span = track_request.send(:format_request_duration, duration_seconds)
    
    match = TIME_SPAN_FORMAT.match time_span
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
    
    match = TIME_SPAN_FORMAT.match time_span
    assert_not_nil match
    assert_equal 1, match['day'].to_i
    assert_equal 0, match['hour'].to_i
    assert_equal 0, match['minute'].to_i
    assert_equal 0, match['second'].to_i
    assert_equal 0, match['fraction'].to_i
  end

  def test_request_id_is_generated_correctly
    app = Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    url = "http://localhost:8080/foo?a=b"
    http_method = 'PUT'
    env = Rack::MockRequest.env_for(url, :method => http_method)
    instrumentation_key = 'key'
    sender = MockAsynchronousSender.new
    track_request = TrackRequest.new app, instrumentation_key, 500, 0
    track_request.send(:sender=, sender)

    # ignores ids that don't begin with | (16 chars)
    env['HTTP_REQUEST_ID'] = 'ab456_1.ea6741a'
    SecureRandom.expects(:base64).with(10).returns('y0NM2eOY/fnQPw==')
    track_request.call(env)
    assert_equal '|y0NM2eOY/fnQPw==.', env['ApplicationInsights.request.id']

    # appends to ids with a dot (8 chars)
    env['HTTP_REQUEST_ID'] = '|1234.'
    SecureRandom.expects(:base64).with(5).returns('eXsMFHs=')
    track_request.call(env)
    assert_equal '|1234.eXsMFHs=_', env['ApplicationInsights.request.id']

    # appends to ids with an underscore (8 chars)
    env['HTTP_REQUEST_ID'] = '|1234_'
    SecureRandom.expects(:base64).with(5).returns('eXsMFHs=')
    track_request.call(env)
    assert_equal '|1234_eXsMFHs=_', env['ApplicationInsights.request.id']

    # appends a dot if neither a dot or underscore are present (8 chars)
    env['HTTP_REQUEST_ID'] = '|ab456_1.ea6741a'
    SecureRandom.expects(:base64).with(5).returns('eXsMFHs=')
    track_request.call(env)
    assert_equal '|ab456_1.ea6741a.eXsMFHs=_', env['ApplicationInsights.request.id']

    # generates a stand-alone id if one is not provided (16 chars)
    env.delete('HTTP_REQUEST_ID')
    SecureRandom.expects(:base64).with(10).returns('y0NM2eOY/fnQPw==')
    track_request.call(env)
    assert_equal '|y0NM2eOY/fnQPw==.', env['ApplicationInsights.request.id']
  end
end
