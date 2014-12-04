require_relative '../../../lib/application_insights/channel/sender_base'
require_relative '../../../lib/application_insights/channel/synchronous_queue'
require 'test/unit'

include ApplicationInsights::Channel

class TestSynchronousQueue < Test::Unit::TestCase
  def test_initialize
    SynchronousQueue.new(MockSynchronousSender.new)
  end

  def test_flush_works_as_expected
    sender = MockSynchronousSender.new
    queue = SynchronousQueue.new sender
    queue.max_queue_length = 3
    (1..7).to_a.each do |i|
      queue.push i
    end
    assert_equal [[1, 2], [3], [4, 5], [6]], sender.data
    temp = []
    queue.instance_variable_get('@queue').length.times do |i|
      temp.push queue.instance_variable_get('@queue').pop
    end
    assert_equal [7], temp
  end
end

class MockSynchronousSender
  def initialize
    @send_buffer_size = 2
    @data = []
    @queue = nil
  end

  attr_accessor :send_buffer_size
  attr_accessor :data
  attr_accessor :queue

  def send(data_to_send)
    @data.push data_to_send
  end
end