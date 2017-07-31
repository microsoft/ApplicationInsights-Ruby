require 'test/unit'
require_relative 'mock_sender'
require_relative '../../lib/application_insights/unhandled_exception'

include ApplicationInsights

class TestUnhandledException < Test::Unit::TestCase
  def test_send
    sender = MockSynchronousSender.new
    error = 'Boom!'
    instrumentation_key = 'one'
    begin
      raise StandardError, error
    rescue
      UnhandledException.send instrumentation_key, sender
    end
    payload = sender.buffer[0]

    assert_equal 1, sender.buffer.count
    assert_equal instrumentation_key, payload[0].i_key
    assert_equal 'Unhandled', payload[0].data.base_data.handled_at
  end
end
