require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Device
    include JsonSerializable

    attr_accessor :id, :ip, :language, :locale, :model, :network, :oem_name, :os,
      :os_version, :role_instance, :role_name, :screen_resolution, :type,
      :vm_name

    attribute_mapping(
      id: 'ai.device.id',
      ip: 'ai.device.ip',
      os: 'ai.device.os',
      type: 'ai.device.type',
      model: 'ai.device.model',
      locale: 'ai.device.locale',
      vm_name: 'ai.device.vmName',
      network: 'ai.device.network',
      oem_name: 'ai.device.oemName',
      language: 'ai.device.language',
      role_name: 'ai.device.roleName',
      os_version: 'ai.device.osVersion',
      role_instance: 'ai.device.roleInstance',
      screen_resolution: 'ai.device.screenResolution'
    )
  end
end
