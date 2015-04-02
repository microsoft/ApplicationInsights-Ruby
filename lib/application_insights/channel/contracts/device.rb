require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Device
    include JsonSerializable

    attr_accessor :id, :ip, :language, :locale, :model, :network, :oem_name,
      :os, :os_version, :role_instance, :role_name, :screen_resolution, :type,
      :machine_name

    attribute_mapping(
      id: 'ai.device.id',
      ip: 'ai.device.ip',
      language: 'ai.device.language',
      locale: 'ai.device.locale',
      model: 'ai.device.model',
      network: 'ai.device.network',
      oem_name: 'ai.device.oemName',
      os: 'ai.device.os',
      os_version: 'ai.device.osVersion',
      role_instance: 'ai.device.roleInstance',
      role_name: 'ai.device.roleName',
      screen_resolution: 'ai.device.screenResolution',
      type: 'ai.device.type',
      machine_name: 'ai.device.machineName'
    )
  end
end
