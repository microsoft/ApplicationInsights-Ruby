require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Operation
    include JsonSerializable

    attr_accessor :id, :name, :parent_id, :root_id, :synthetic_source, :is_synthetic, :correlation_vector

    attribute_mapping(
      id: 'ai.operation.id',
      name: 'ai.operation.name',
      parent_id: 'ai.operation.parentId',
      root_id: 'ai.operation.rootId',
      synthetic_source: 'ai.operation.syntheticSource',
      is_synthetic: 'ai.operation.isSynthetic',
      correlation_vector: 'ai.operation.correlationVector'
    )
  end
end
