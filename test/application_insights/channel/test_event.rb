require_relative '../../../lib/application_insights/channel/sender_base'
require_relative '../../../lib/application_insights/channel/asynchronous_queue'
require 'thread'
require 'test/unit'

include ApplicationInsights::Channel

class TestEvent < Test::Unit::TestCase
  def test_initialize
    event = Event.new
    assert_equal false, event.signal
  end

  def test_set_works_as_expected
    event = Event.new
    assert_equal false, event.signal
    Thread.new do
      sleep 1
      event.set
    end
    result = event.wait 2.0
    assert_equal true, result
  end

  def test_clear_works_as_expected
    event = Event.new
    assert_equal false, event.signal
    event.set
    assert_equal true, event.signal
    event.clear
    assert_equal false, event.signal
  end

  def test_wait_works_as_expected
    event1 = Event.new
    assert_equal false, event1.signal
    Thread.new do
      sleep 1
      event1.set
    end
    result = event1.wait 0.5
    assert_equal false, result

    event2 = Event.new
    assert_equal false, event1.signal
    Thread.new do
      sleep 1
      event2.set
    end
    result = event2.wait 2.0
    assert_equal true, result
  end
end