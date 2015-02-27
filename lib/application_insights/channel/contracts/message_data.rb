require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class MessageData
    include JsonSerializable

    attributes :ver, :message, :severityLevel, :properties

    def ver
      @ver ||= 2
    end

    def properties
      @properties ||= {}
    end
  end
end
