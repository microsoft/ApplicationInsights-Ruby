require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Data
    include JsonSerializable

    attributes :baseType, :baseData
  end
end
