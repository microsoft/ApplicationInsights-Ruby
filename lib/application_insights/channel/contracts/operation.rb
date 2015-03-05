require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Operation
    include JsonSerializable

    attr_accessor :id, :name, :parent_id, :root_id,
      :synthetic_source, :is_synthetic

    attribute_mapping(
      id: 'ai.operation.id',
      name: 'ai.operation.name',
      root_id: 'ai.operation.rootId',
      parent_id: 'ai.operation.parentId',
      is_synthetic: 'ai.operation.isSynthetic',
      synthetic_source: 'ai.operation.syntheticSource'
    )
  end
end
