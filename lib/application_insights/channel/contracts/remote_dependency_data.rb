require_relative 'json_serializable'
require_relative 'data_point_type'
require_relative 'dependency_kind'
require_relative 'dependency_source_type'

module ApplicationInsights::Channel::Contracts
  class RemoteDependencyData
    include JsonSerializable

    attr_accessor :ver, :name, :kind, :value, :count, :min, :max, :std_dev,
      :dependency_kind, :success, :async, :dependency_source, :command_name,
      :dependency_type_name, :properties

    attribute_mapping(
      ver: 'ver',
      name: 'name',
      kind: 'kind',
      value: 'value',
      count: 'count',
      min: 'min',
      max: 'max',
      std_dev: 'stdDev',
      dependency_kind: 'dependencyKind',
      success: 'success',
      async: 'async',
      dependency_source: 'dependencySource',
      command_name: 'commandName',
      dependency_type_name: 'dependencyTypeName',
      properties: 'properties'
    )

    def ver
      @ver ||= 2
    end

    def kind
      @kind ||= DataPointType::MEASUREMENT
    end

    def dependency_kind
      @dependency_kind ||= DependencyKind::OTHER
    end

    def success
      @success.nil? ? true : @success
    end

    def dependency_source
      @dependency_source ||= DependencySourceType::UNDEFINED
    end

    def properties
      @properties ||= {}
    end
  end
end
