require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class User
    include JsonSerializable

    prefix 'ai.user.'
    attributes :accountAcquisitionDate, :accountId, :userAgent, :id
  end
end
