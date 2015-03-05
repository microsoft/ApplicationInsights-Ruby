require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class ExceptionData
    include JsonSerializable

    attr_accessor :ver, :handled_at, :exceptions, :severity_level,
      :properties, :measurements, :problem_id, :crash_thread_id

    attribute_mapping(
      ver: 'ver',
      problem_id: 'problemId',
      handled_at: 'handledAt',
      exceptions: 'exceptions',
      properties: 'properties',
      measurements: 'measurements',
      severity_level: 'severityLevel',
      crash_thread_id: 'crashThreadId'
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
