require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Location
    include JsonSerializable

    attr_accessor :ip, :country, :province, :city

    attribute_mapping(
      ip: 'ai.location.ip',
      country: 'ai.location.country',
      province: 'ai.location.province',
      city: 'ai.location.city'
    )
  end
end
