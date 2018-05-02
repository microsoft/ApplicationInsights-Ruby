require_relative '../../../lib/application_insights/channel/sender_base'
require_relative '../../../lib/application_insights/channel/asynchronous_queue'
require_relative '../mock_sender'
require 'test/unit'

include ApplicationInsights::Channel

class TestAsynchronousQueue < Test::Unit::TestCase
  def test_initialize
    queue = AsynchronousQueue.new MockAsynchronousSender.new
    assert_not_nil queue.flush_notification
  end

  def test_flush_notification_works_as_expected
    queue = AsynchronousQueue.new MockAsynchronousSender.new
    assert_not_nil queue.flush_notification
    result = queue.flush_notification.wait 1
    assert_equal false, result
    queue.flush_notification.set
    result = queue.flush_notification.wait
    assert_equal true, result
    queue.flush_notification.clear
    result = queue.flush_notification.wait 1
    assert_equal false, result
  end

  def test_push_works_As_expected
    sender = MockAsynchronousSender.new
    queue = AsynchronousQueue.new sender
    queue.push 42

    # Make sure the sender has fetched the data from queue
    sleep(sender.send_interval)

    assert_nil queue.pop
    assert_equal [42], sender.buffer[0]
  end

  def test_flush_works_as_expected
    sender = MockAsynchronousSender.new
    queue = AsynchronousQueue.new sender
    assert_not_nil queue.flush_notification
    result = queue.flush_notification.wait 1
    assert_equal false, result
    queue.flush
    assert_equal 1, sender.start_call_count
  end
end
