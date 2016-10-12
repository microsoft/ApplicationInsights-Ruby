require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class ExceptionData
    include JsonSerializable

    attr_accessor :ver, :handled_at, :exceptions, :severity_level, :problem_id,
      :crash_thread_id, :properties, :measurements

    attribute_mapping(
      ver: 'ver',
      handled_at: 'handledAt',
      exceptions: 'exceptions',
      severity_level: 'severityLevel',
      problem_id: 'problemId',
      crash_thread_id: 'crashThreadId',
      properties: 'properties',
      measurements: 'measurements'
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
