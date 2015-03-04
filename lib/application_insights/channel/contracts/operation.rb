require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Operation
    include JsonSerializable

    attr_accessor :id, :name, :parent_id, :root_id

    attribute_mapping(
      id: 'ai.operation.id',
      name: 'ai.operation.name',
      root_id: 'ai.operation.rootId',
      parent_id: 'ai.operation.parentId'
    )
  end
end
