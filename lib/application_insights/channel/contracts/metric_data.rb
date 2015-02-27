require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class MetricData
    include JsonSerializable

    attributes :ver, :metrics, :properties

    def ver
      @ver ||= 2
    end

    def metrics
      @metrics ||= []
    end

    def properties
      @properties ||= {}
    end
  end
end
