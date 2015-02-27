require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class ExceptionData
    include JsonSerializable

    attributes :ver, :handledAt, :exceptions, :severityLevel, :properties, :measurements

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
