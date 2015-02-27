require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class RequestData
    include JsonSerializable

    attributes :ver, :id, :name, :startTime, :duration, :responseCode, :success,
               :httpMethod, :url, :properties, :measurements

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
