require 'test/unit'
require_relative '../../lib/application_insights/unhandled_exception'

include ApplicationInsights

class TestUnhandledException < Test::Unit::TestCase

  def test_send
    sender = MockSender.new
    error = 'Boom!'
    instrumentation_key = 'one'
    begin
      raise StandardError, error
    rescue
      UnhandledException.send instrumentation_key, sender
    end

    assert_equal 1, sender.buffer.count
    payload = sender.buffer[0]
    assert_equal instrumentation_key, payload[0].i_key
  end
end

class MockSender
  def initialize
    @buffer = []
    @queue = nil
    @send_buffer_size = 100
  end

  attr_accessor :buffer
  attr_accessor :queue
  attr_accessor :send_buffer_size

  def send(data)
    @buffer << data
  end

  def flush
  end
end