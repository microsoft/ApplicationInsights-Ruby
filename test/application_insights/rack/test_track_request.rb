require 'test/unit'
require 'rack/mock'
require_relative '../mock_sender'
require_relative '../../../lib/application_insights/rack/track_request'

include ApplicationInsights

class TestTrackRequest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_call_works_as_expected
    response_code = rand(200..204)
    app = Proc.new {|env| sleep(2); [response_code, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    url = "http://localhost:8080/foo"
    http_method = 'PUT'
    env = Rack::MockRequest.env_for(url, :method => http_method)
    instrumentation_key = 'key'
    sender = MockAsynchronousSender.new
    track_request = TrackRequest.new app, instrumentation_key, sender
    start_time = Time.now
    track_request.call(env)
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
    assert_in_epsilon Time.parse(request_data.start_time) - start_time, 0, 0.01
  end

  def test_call_with_failed_request
    response_code = rand(400..600)
    app = Proc.new {|env| [response_code, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    url = "http://localhost:8080/foo"
    http_method = 'PUT'
    env = Rack::MockRequest.env_for(url, :method => http_method)
    instrumentation_key = 'key'
    sender = MockAsynchronousSender.new
    track_request = TrackRequest.new app, instrumentation_key, sender
    track_request.call(env)
    sleep(sender.send_interval)

    payload = sender.buffer[0]
    request_data = payload[0].data.base_data
    assert_equal false, request_data.success
  end

  def test_seconds_to_time_span
    app = Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Hello Rack!"]]}
    track_request = TrackRequest.new app, 'one'
    duration_seconds = rand(91000) + rand
    time_span = track_request.send(:seconds_to_time_span, duration_seconds)
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
end