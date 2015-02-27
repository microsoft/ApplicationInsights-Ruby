require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Application
    include JsonSerializable

    prefix 'ai.application.'
    attributes :ver
  end
end
