require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Internal
    include JsonSerializable

    prefix 'ai.internal.'
    attributes :sdkVersion, :agentVersion
  end
end
