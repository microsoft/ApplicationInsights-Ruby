require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Cloud
    include JsonSerializable

    attr_accessor :role_name, :role_instance

    attribute_mapping(
      role_name: 'ai.cloud.role',
      role_instance: 'ai.cloud.roleInstance'
    )
  end
end
