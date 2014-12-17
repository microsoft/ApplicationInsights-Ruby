require 'json'
require 'net/http'

module ApplicationInsights
  module Channel
    # The base class for all of our senders.
    class SenderBase
      # Initializes a new instance of the sender class.
      def initialize(service_endpoint_uri)
        raise ArgumentError, 'Service endpoint URI was required but not provided' unless service_endpoint_uri
        @service_endpoint_uri = service_endpoint_uri
        @queue = nil
        @send_buffer_size = 100
      end

      # Gets the service endpoint URI property. This is where we send data to.
      attr_accessor :service_endpoint_uri

      # The queue that we will be draining
      attr_accessor :queue

      # Gets or sets the buffer size for a single batch of telemetry. This is the maximum number of items in a single service request we are going to send.
      attr_accessor :send_buffer_size

      # Sends the data to send list to the service immediately.
      def send(data_to_send)
        uri = URI(@service_endpoint_uri)
        request = Net::HTTP::Post.new(uri.path, { 'Accept' => 'application/json', 'Content-Type' => 'application/json; charset=utf-8' })
        request.body = data_to_send.to_json

        http = Net::HTTP.new uri.hostname, uri.port
        if uri.scheme.downcase == 'https'
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
        response = http.request(request)

        case response
          when Net::HTTPSuccess, Net::HTTPRedirection, Net::HTTPBadRequest
            return
          else
            data_to_send.each do |item|
              @queue.push item
            end
        end
      end
    end
  end
end
