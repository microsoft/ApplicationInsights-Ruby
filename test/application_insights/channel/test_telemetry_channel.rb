require_relative '../../../lib/application_insights/channel/telemetry_channel'
require_relative '../../../lib/application_insights/channel/telemetry_context'
require_relative '../../../lib/application_insights/channel/synchronous_queue'
require_relative '../../../lib/application_insights/channel/synchronous_sender'
require 'test/unit'

include ApplicationInsights::Channel

class TestTelemetryChannel < Test::Unit::TestCase
  def test_initialize
    channel = TelemetryChannel.new
    assert_not_nil channel.context
    assert_not_nil channel.queue
    assert_not_nil channel.sender
  end

  def test_context_works_as_expected
    context = TelemetryContext.new
    channel = TelemetryChannel.new
    assert_not_nil channel.context
    assert_not_same context, channel.context
    channel = TelemetryChannel.new context
    assert_same context, channel.context
  end

  def test_queue_works_as_expected
    queue = SynchronousQueue.new SynchronousSender.new
    channel = TelemetryChannel.new
    assert_not_nil channel.queue
    assert_not_same queue, channel.queue
    channel = TelemetryChannel.new nil, queue
    assert_same queue, channel.queue
  end

  def test_sender_works_as_expected
    queue = SynchronousQueue.new SynchronousSender.new
    channel = TelemetryChannel.new
    assert_not_nil channel.sender
    assert_not_same queue.sender, channel.sender
    channel = TelemetryChannel.new nil, queue
    assert_same queue.sender, channel.sender
  end

  def test_flush_works_as_expected
    queue = MockTelemetryChannelQueue.new SynchronousSender.new
    channel = TelemetryChannel.new nil, queue
    assert_equal 0, queue.flush_count
    channel.flush
    assert_equal 1, queue.flush_count
  end

  def test_write_works_as_expected
    queue = MockTelemetryChannelQueue.new SynchronousSender.new
    context = TelemetryContext.new
    context.instrumentation_key = 'instrumentation key'
    channel = TelemetryChannel.new context, queue
    expected = MockTelemetryItemData.new
    channel.write expected
    assert_equal 1, queue.queue.count
    actual = queue.queue[0]
    assert_not_nil actual
    assert_equal 1, actual.ver
    assert_equal 100, actual.sample_rate
    assert_equal 'Microsoft.ApplicationInsights.MockTelemetryItem', actual.name
    assert_not_nil actual.time
    assert_equal 'instrumentation key', actual.i_key
    assert_not_nil actual.tags
    assert_equal 1, actual.tags.count
    assert_equal 'rb:'+ ApplicationInsights::VERSION, actual.tags['ai.internal.sdkVersion']
    assert_not_nil actual.data
    assert_equal 'MockTelemetryItemData', actual.data.base_type
    assert_same expected, actual.data.base_data
  end
end

class MockTelemetryItemData
  def initialize
    @properties = {}
  end

  attr_accessor :properties
end

class MockTelemetryChannelQueue < QueueBase
  def initialize(sender)
    super sender
    @queue = []
    @flush_count = 0
  end

  attr_accessor :flush_count, :queue

  def push(data)
    @queue.push data
  end

  def flush
    @flush_count += 1
  end
end
