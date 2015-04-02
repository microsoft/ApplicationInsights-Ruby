require_relative '../../lib/application_insights/channel/synchronous_sender'
require_relative '../../lib/application_insights/channel/asynchronous_sender'

include ApplicationInsights::Channel

class MockSynchronousSender < SynchronousSender
  def initialize
    @buffer = []
    super
  end

  attr_accessor :buffer

  def send(data)
    @buffer << data
  end
end

class MockAsynchronousSender < AsynchronousSender
  def initialize
    @buffer = []
    @start_call_count = 0
    super
  end

  attr_accessor :start_call_count
  attr_accessor :buffer

  def start
    @start_call_count += 1
    super
  end

  def send(data)
    @buffer << data
  end
end
