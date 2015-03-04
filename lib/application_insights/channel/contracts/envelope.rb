require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Envelope
    include JsonSerializable

    attr_accessor :ver, :name, :time, :sample_rate, :seq, :i_key, :flags,
      :device_id, :os, :os_ver, :app_id, :app_ver, :user_id, :tags, :data

    attribute_mapping(
      os: 'os',
      ver: 'ver',
      seq: 'seq',
      name: 'name',
      time: 'time',
      tags: 'tags',
      data: 'data',
      i_key: 'iKey',
      flags: 'flags',
      os_ver: 'osVer',
      app_id: 'appId',
      app_ver: 'appVer',
      user_id: 'userId',
      device_id: 'deviceId',
      sample_rate: 'sampleRate'
    )

    def ver
      @ver ||= 1
    end

    def sample_rate
      @sample_rate ||= 100.0
    end

    def tags
      @tags ||= {}
    end
  end
end
