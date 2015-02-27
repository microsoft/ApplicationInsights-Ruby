require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Location
    include JsonSerializable

    prefix 'ai.location.'
    attributes :ip
  end
end
