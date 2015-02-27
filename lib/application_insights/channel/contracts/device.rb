require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Device
    include JsonSerializable

    prefix 'ai.device.'
    attributes :id, :ip, :language, :locale, :model, :network, :oemName, :os,
               :osVersion, :roleInstance, :roleName, :screenResolution, :type,
               :vmName
  end
end
