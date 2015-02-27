require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class EventData
    include JsonSerializable

    attributes :ver, :name, :properties, :measurements

    def ver
      @ver ||= 2
    end

    def properties
      @properties ||= {}
    end

    def measurements
      @measurements ||= {}
    end
  end
end
