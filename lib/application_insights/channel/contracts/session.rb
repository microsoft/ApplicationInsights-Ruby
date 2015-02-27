require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Session
    include JsonSerializable

    prefix 'ai.session.'
    attributes :id, :isFirst, :isNew
  end
end
