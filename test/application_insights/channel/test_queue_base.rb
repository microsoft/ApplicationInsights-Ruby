require_relative '../../../lib/application_insights/channel/queue_base'
require_relative '../../../lib/application_insights/channel/sender_base'
require 'test/unit'

include ApplicationInsights::Channel

class TestQueueBase < Test::Unit::TestCase
  def test_initialize
    sender = SenderBase.new 'http://tempuri.org'
    item = QueueBase.new sender
    assert_equal sender.queue, item
    assert_equal 500, item.max_queue_length
    assert_equal sender, item.sender
  end

  def test_max_queue_length_works_as_expected
    sender = SenderBase.new 'http://tempuri.org'
    item = QueueBase.new sender
    assert_equal 500, item.max_queue_length
    item.max_queue_length = 42
    assert_equal 42, item.max_queue_length
  end

  def test_sender_works_as_expected
    sender = SenderBase.new 'http://tempuri.org'
    item = QueueBase.new sender
    assert_equal sender, item.sender
  end

  def test_push_will_not_enqueue_nil
    sender = SenderBase.new 'http://tempuri.org'
    item = QueueBase.new sender
    queue = item.instance_variable_get('@queue')
    item.push nil
    assert queue.empty?
  end

  def test_push_works_as_expected
    sender = SenderBase.new 'http://tempuri.org'
    item = MockQueueBase.new sender
    item.max_queue_length = 2
    queue = item.instance_variable_get('@queue')
    [[7, 0], [8, 1], [9, 2]].each do |i, count|
      item.push i
      assert_equal count, item.flush_count
    end
    assert_equal 3, queue.length
    temp = []
    queue.length.times do |i|
      temp.push queue.pop
    end
    assert_equal [7, 8, 9], temp
  end

  def test_pop_works_as_expected
    sender = SenderBase.new 'http://tempuri.org'
    item = QueueBase.new sender
    queue = item.instance_variable_get('@queue')
    [7, 8, 9].each do |i|
      queue.push i
    end
    [7, 8, 9, nil].each do |i|
      assert_equal i, item.pop
    end
  end

  def test_empty_works_as_expected
    sender = SenderBase.new 'http://tempuri.org'
    queue = QueueBase.new sender
    assert_equal true, queue.empty?
    queue.push 1
    assert_equal false, queue.empty?
    queue.pop
    assert_equal true, queue.empty?
  end
end

class MockQueueBase < QueueBase
  def initialize(sender)
    super sender
    @flush_count = 0
  end

  attr_accessor :flush_count

  def flush
    @flush_count += 1
  end
end