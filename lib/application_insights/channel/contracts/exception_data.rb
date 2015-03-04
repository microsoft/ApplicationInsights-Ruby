require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class ExceptionData
    include JsonSerializable

    attr_accessor :ver, :handled_at, :exceptions, :severity_level,
      :properties, :measurements

    attribute_mapping(
      ver: 'ver',
      handled_at: 'handledAt',
      exceptions: 'exceptions',
      properties: 'properties',
      measurements: 'measurements',
      severity_level: 'severityLevel'
    )

    def ver
      @ver ||= 2
    end

    def exceptions
      @exceptions ||= []
    end

    def properties
      @properties ||= {}
    end

    def measurements
      @measurements ||= {}
    end
  end
end
