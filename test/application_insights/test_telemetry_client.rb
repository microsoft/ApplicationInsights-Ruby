require_relative '../../lib/application_insights/telemetry_client'
require_relative '../../lib/application_insights/channel/sender_base'
require_relative '../../lib/application_insights/channel/synchronous_queue'
require_relative '../../lib/application_insights/channel/telemetry_channel'
require 'json'
require 'test/unit'
require 'time'

include ApplicationInsights

class TestTelemetryClient < Test::Unit::TestCase
  def test_initialize
    client = TelemetryClient.new
    assert_not_nil client.context
    assert_not_nil client.channel

    channel = Object.new
    client = TelemetryClient.new 'a', channel
    assert_not_nil client.context
    assert_same channel, client.channel
    assert_equal 'a', client.context.instrumentation_key
  end

  def test_context_property_works_as_expected
    client = TelemetryClient.new
    assert_not_nil client.context
  end

  def test_channel_property_works_as_expected
    client = TelemetryClient.new
    assert_not_nil client.channel
  end

  def test_track_page_view_works_as_expected
    client, sender = self.create_client
    client.track_page_view 'test', 'http://tempuri.org'
    client.flush
    expected = '[{"ver":1,"name":"Microsoft.ApplicationInsights.PageView","time":"TIME_PLACEHOLDER","sampleRate":100.0,"tags":{"ai.internal.sdkVersion":"rb:__version__"},"data":{"baseType":"PageViewData","baseData":{"ver":2,"url":"http://tempuri.org","name":"test"}}}]'.gsub!(/__version__/, ApplicationInsights::VERSION)
    sender.data_to_send[0].time = 'TIME_PLACEHOLDER'
    actual = sender.data_to_send.to_json
    assert_equal expected, actual
  end

  def test_track_exception_works_as_expected
    client, sender = self.create_client
    begin
      raise ArgumentError, 'Some error'
    rescue => e
      client.track_exception e
    end
    client.flush
    expected = '[{"ver":1,"name":"Microsoft.ApplicationInsights.Exception","time":"TIME_PLACEHOLDER","sampleRate":100.0,"tags":{"ai.internal.sdkVersion":"rb:__version__"},"data":{"baseType":"ExceptionData","baseData":{"ver":2,"handledAt":"UserCode","exceptions":[{"id":1,"outerId":0,"typeName":"ArgumentError","message":"Some error","hasFullStack":true,"stack":"STACK_PLACEHOLDER"}]}}}]'.gsub!(/__version__/, ApplicationInsights::VERSION)
    assert_equal 'UserCode', sender.data_to_send[0].data.base_data.handled_at
    assert_operator sender.data_to_send[0].data.base_data.exceptions[0].parsed_stack.count, :>, 0
    assert_equal 'test_track_exception_works_as_expected', sender.data_to_send[0].data.base_data.exceptions[0].parsed_stack[0].method
    assert_equal __FILE__, sender.data_to_send[0].data.base_data.exceptions[0].parsed_stack[0].file_name
    sender.data_to_send[0].time = 'TIME_PLACEHOLDER'
    sender.data_to_send[0].data.base_data.exceptions[0].stack = 'STACK_PLACEHOLDER'
    sender.data_to_send[0].data.base_data.exceptions[0].parsed_stack = []
    actual = sender.data_to_send.to_json
    assert_equal expected, actual
  end

  def test_track_event_works_as_expected
    client, sender = self.create_client
    client.track_event 'test'
    client.flush
    expected = '[{"ver":1,"name":"Microsoft.ApplicationInsights.Event","time":"TIME_PLACEHOLDER","sampleRate":100.0,"tags":{"ai.internal.sdkVersion":"rb:__version__"},"data":{"baseType":"EventData","baseData":{"ver":2,"name":"test"}}}]'.gsub!(/__version__/, ApplicationInsights::VERSION)
    sender.data_to_send[0].time = 'TIME_PLACEHOLDER'
    actual = sender.data_to_send.to_json
    assert_equal expected, actual
  end

  def test_track_metric_works_as_expected
    client, sender = self.create_client
    client.track_metric 'test', 42
    client.flush
    expected = '[{"ver":1,"name":"Microsoft.ApplicationInsights.Metric","time":"TIME_PLACEHOLDER","sampleRate":100.0,"tags":{"ai.internal.sdkVersion":"rb:__version__"},"data":{"baseType":"MetricData","baseData":{"ver":2,"metrics":[{"name":"test","kind":1,"value":42}]}}}]'.gsub!(/__version__/, ApplicationInsights::VERSION)
    sender.data_to_send[0].time = 'TIME_PLACEHOLDER'
    actual = sender.data_to_send.to_json
    assert_equal expected, actual
  end

  def test_track_trace_view_works_as_expected
    client, sender = self.create_client
    client.track_trace 'test', Channel::Contracts::SeverityLevel::WARNING
    client.flush
    expected = '[{"ver":1,"name":"Microsoft.ApplicationInsights.Message","time":"TIME_PLACEHOLDER","sampleRate":100.0,"tags":{"ai.internal.sdkVersion":"rb:__version__"},"data":{"baseType":"MessageData","baseData":{"ver":2,"message":"test","severityLevel":2}}}]'.gsub!(/__version__/, ApplicationInsights::VERSION)
    sender.data_to_send[0].time = 'TIME_PLACEHOLDER'
    actual = sender.data_to_send.to_json
    assert_equal expected, actual
  end

  def test_track_request_works_as_expected
    start_time = Time.now.iso8601
    client, sender = self.create_client
    client.track_request 'test', start_time, '0:00:00:02.0000000','200', true
    client.flush
    expected = '[{"ver":1,"name":"Microsoft.ApplicationInsights.Request","time":"__time__","sampleRate":100.0,"tags":{"ai.internal.sdkVersion":"rb:__version__"},"data":{"baseType":"RequestData","baseData":{"ver":2,"id":"test","startTime":"__time__","duration":"0:00:00:02.0000000","responseCode":"200","success":true}}}]'
      .gsub!(/__version__/, ApplicationInsights::VERSION)
      .gsub!(/__time__/, start_time)
    actual = sender.data_to_send.to_json
    assert_equal expected, actual
  end

  def test_track_request_works_as_expected_when_request_is_failed
    start_time = Time.now.iso8601
    client, sender = self.create_client
    client.track_request 'test', start_time, '0:00:00:02.0000000','200', false
    client.flush
    expected = '[{"ver":1,"name":"Microsoft.ApplicationInsights.Request","time":"__time__","sampleRate":100.0,"tags":{"ai.internal.sdkVersion":"rb:__version__"},"data":{"baseType":"RequestData","baseData":{"ver":2,"id":"test","startTime":"__time__","duration":"0:00:00:02.0000000","responseCode":"200","success":false}}}]'
      .gsub!(/__version__/, ApplicationInsights::VERSION)
      .gsub!(/__time__/, start_time)
    actual = sender.data_to_send.to_json
    assert_equal expected, actual
  end

  def create_client
    sender = MockTelemetryClientSender.new
    queue = Channel::SynchronousQueue.new sender
    channel = Channel::TelemetryChannel.new nil, queue
    client = TelemetryClient.new nil, channel
    return client, sender
  end
end

class MockTelemetryClientSender < Channel::SenderBase
  def initialize
    super 'http://tempuri.org'
    @data_to_send = []
  end

  attr_accessor :data_to_send

  def send(data_to_send)
    @data_to_send = data_to_send
  end
end
