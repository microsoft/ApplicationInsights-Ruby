require_relative 'json_serializable'
require_relative 'data_point_type'
require_relative 'dependency_kind'
require_relative 'dependency_source_type'

module ApplicationInsights::Channel::Contracts
  class RemoteDependencyData
    include JsonSerializable

    attr_accessor :ver, :name, :kind, :value, :count, :min, :max, :std_dev,
      :dependency_kind, :success, :async, :dependency_source, :properties

    attribute_mapping(
      ver: 'ver',
      min: 'min',
      max: 'max',
      name: 'name',
      kind: 'kind',
      value: 'value',
      count: 'count',
      async: 'async',
      std_dev: 'stdDev',
      success: 'success',
      properties: 'properties',
      dependency_kind: 'dependencyKind',
      dependency_source: 'dependencySource'
    )

    def ver
      @ver ||= 2
    end

    def kind
      @kind ||= DataPointType::MEASUREMENT
    end

    def dependency_kind
      @dependency_kind ||= DependencyKind::UNDEFINED
    end

    def dependency_source
      @dependency_source ||= DependencySourceType::UNDEFINED
    end

    def properties
      @properties ||= {}
    end
  end
end
