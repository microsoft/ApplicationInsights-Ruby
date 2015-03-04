require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class RequestData
    include JsonSerializable

    attr_accessor :ver, :id, :name, :start_time, :duration, :response_code,
      :success, :http_method, :url, :properties, :measurements

    attribute_mapping(
      id: 'id',
      ver: 'ver',
      url: 'url',
      name: 'name',
      success: 'success',
      duration: 'duration',
      start_time: 'startTime',
      properties: 'properties',
      http_method: 'httpMethod',
      measurements: 'measurements',
      response_code: 'responseCode'
    )

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
