require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class RequestData
    include JsonSerializable

    attr_accessor :ver, :id, :name, :start_time, :duration, :response_code,
      :success, :http_method, :url, :properties, :measurements

    attribute_mapping(
      ver: 'ver',
      id: 'id',
      name: 'name',
      start_time: 'startTime',
      duration: 'duration',
      response_code: 'responseCode',
      success: 'success',
      http_method: 'httpMethod',
      url: 'url',
      properties: 'properties',
      measurements: 'measurements'
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
