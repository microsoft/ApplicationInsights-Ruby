require_relative 'json_serializable'
require_relative 'data_point_type'
require_relative 'dependency_kind'
require_relative 'dependency_source_type'

module ApplicationInsights::Channel::Contracts
  class RemoteDependencyData
    include JsonSerializable

    attributes :ver, :name, :kind, :value, :count, :min, :max, :stdDev, :dependencyKind,
               :success, :async, :dependencySource, :properties

    def ver
      @ver ||= 2
    end

    def kind
      @kind ||= DataPointType::MEASUREMENT
    end

    def dependency_kind
      @dependencyKind ||= DependencyKind::UNDEFINED
    end

    def dependency_source
      @dependencySource ||= DependencySourceType::UNDEFINED
    end

    def properties
      @properties ||= {}
    end
  end
end
