require_relative '../../../lib/application_insights/channel/queue_base'
require_relative '../../../lib/application_insights/channel/sender_base'
require_relative '../test_logger'
require 'socket'
require 'test/unit'
require 'thread'

include ApplicationInsights::Channel

class TestSenderBase < Test::Unit::TestCase
  def test_initialize
    sender = SenderBase.new 'http://tempuri.org'
    assert_equal 'http://tempuri.org', sender.service_endpoint_uri
    assert_nil sender.queue
    assert_equal 100, sender.send_buffer_size
  end

  def test_service_endpoint_uri
    sender = SenderBase.new 'http://tempuri.org'
    assert_equal 'http://tempuri.org', sender.service_endpoint_uri
    sender.service_endpoint_uri = 'http://live.com'
    assert_equal 'http://live.com', sender.service_endpoint_uri
  end

  def test_sender_queue_attribute
    sender = SenderBase.new 'http://tempuri.org'
    assert_nil sender.queue
    temp = Object.new
    sender.queue = temp
    assert_equal temp, sender.queue
  end

  def test_send_buffer_size_works_as_expected
    sender = SenderBase.new 'http://tempuri.org'
    assert_equal 100, sender.send_buffer_size
    sender.send_buffer_size = 42
    assert_equal 42, sender.send_buffer_size
  end

  def test_send_works_as_expected_with_400_code
    thread, port = execute_server '400 BadRequest'
    test_logger = TestLogger.new
    sender = SenderBase.new 'http://localhost:' + port.to_s + '/track'
    sender.logger = test_logger
    sender.queue = []
    sender.send([1, 2])
    thread.join
    assert_equal [], sender.queue
    assert_true test_logger.messages.include?('BadRequest')
  end

  def test_send_works_as_expected_with_500_code
    thread, port = execute_server '500 InternalServerError'
    test_logger = TestLogger.new
    sender = SenderBase.new 'http://localhost:' + port.to_s + '/track'
    sender.logger = test_logger
    sender.queue = []
    sender.send([1, 2])
    thread.join
    assert_equal [], sender.queue
    assert_true test_logger.messages.include?('InternalServerError')
  end

  def execute_server(code)
    port = 50000 + Random.rand(10000)
    thread = Thread.new {
      server = TCPServer.new(port)
      client = server.accept
      request = ''
      read_buffer_size = 64
      while true
        temp = client.recv(read_buffer_size)
        request += temp
        break if temp.length < read_buffer_size
      end
      request = request.split(/\n/)[-1]
      response = request
      headers = [
          "HTTP/1.1 " + code,
          "Content-Type: application/json",
          "Content-Length: #{response.length}\r\n\r\n"
      ].join("\r\n")
      client.puts headers
      client.puts response
      client.close
    }

    while thread.status != 'sleep'
      sleep 0.1
    end

    return thread, port
  end
end
