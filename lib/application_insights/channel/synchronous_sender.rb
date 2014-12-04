require_relative 'sender_base'

module ApplicationInsights
  module Channel
    # A synchronous sender that works in conjunction with SynchronousQueue.
    class SynchronousSender < SenderBase
      # Initializes a new instance of the synchronous sender class.
      def initialize(service_endpoint_uri='http://dc.services.visualstudio.com/v2/track')
        super service_endpoint_uri
      end
    end
  end
end