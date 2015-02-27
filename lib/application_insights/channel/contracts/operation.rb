require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Operation
    include JsonSerializable

    prefix 'ai.operation.'
    attributes :id, :name, :parentId, :rootId
  end
end
