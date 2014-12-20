require_relative '../../../lib/application_insights/channel/sender_base'
require_relative '../../../lib/application_insights/channel/asynchronous_sender'
require_relative '../../../lib/application_insights/channel/asynchronous_queue'
require 'test/unit'

include ApplicationInsights::Channel

class TestAsynchronousSender < Test::Unit::TestCase
  def test_initialize
    sender = AsynchronousSender.new
    assert_equal 'https://dc.services.visualstudio.com/v2/track', sender.service_endpoint_uri
    assert_equal 1.0, sender.send_interval
    assert_equal 3.0, sender.send_time
  end

  def test_send_interval_works_as_expected
    sender = AsynchronousSender.new
    assert_equal 1.0, sender.send_interval
    sender.send_interval = 10.0
    assert_equal 10.0, sender.send_interval
  end

  def test_send_time_works_as_expected
    sender = AsynchronousSender.new
    assert_equal 3.0, sender.send_time
    sender.send_time = 10.0
    assert_equal 10.0, sender.send_time
  end

  def test_start
    sender = InterceptableAsynchronousSender.new
    sender.send_interval = 1.0
    sender.send_time = 3.0
    queue = InterceptableAsynchronousQueue.new sender
    sender.invoke_base_start = false
    queue.push 1
    queue.push 2
    sender.invoke_base_start = true
    sender.start
    sleep (2.0 * sender.send_time / 3.0)
    queue.push 3
    sleep (1.0 * sender.send_time / 3.0) + 2.0
    data = sender.data_to_send
    assert_equal [[1, 2], [3]], data
    pop_calls = queue.pop_calls
    assert_equal 10, pop_calls.length
  end

end

class InterceptableAsynchronousQueue < AsynchronousQueue
  def initialize(sender)
    @pop_calls = []
    super sender
  end

  attr_accessor :pop_calls

  def pop
    output = super
    @pop_calls.push [ Time.new, output ]
    return output
  end
end

class InterceptableAsynchronousSender < AsynchronousSender
  def initialize
    @data_to_send = []
    @invoke_base_start = false
    super
  end

  attr_accessor :invoke_base_start
  attr_accessor :data_to_send

  def start
    if invoke_base_start
      super
    end
  end

  def send(data_to_send)
    @data_to_send.push data_to_send
  end
end