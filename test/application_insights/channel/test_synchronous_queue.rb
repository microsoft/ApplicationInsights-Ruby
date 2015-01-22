require_relative '../../../lib/application_insights/channel/sender_base'
require_relative '../../../lib/application_insights/channel/synchronous_queue'
require_relative '../mock_sender'
require 'test/unit'

include ApplicationInsights::Channel

class TestSynchronousQueue < Test::Unit::TestCase
  def test_initialize
    SynchronousQueue.new(MockSynchronousSender.new)
  end

  def test_flush_works_as_expected
    sender = MockSynchronousSender.new
    sender.send_buffer_size = 2
    queue = SynchronousQueue.new sender
    queue.max_queue_length = 3
    (1..7).to_a.each do |i|
      queue.push i
    end
    assert_equal [[1, 2], [3], [4, 5], [6]], sender.buffer
    temp = []
    queue.instance_variable_get('@queue').length.times do |i|
      temp.push queue.instance_variable_get('@queue').pop
    end
    assert_equal [7], temp
  end
end