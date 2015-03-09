require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Session
    include JsonSerializable

    attr_accessor :id, :is_first, :is_new

    attribute_mapping(
      id: 'ai.session.id',
      is_first: 'ai.session.isFirst',
      is_new: 'ai.session.isNew'
    )
  end
end
