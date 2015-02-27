require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Envelope
    include JsonSerializable

    attributes :ver, :name, :time, :sampleRate, :seq, :iKey, :flags, :deviceId,
               :os, :osVer, :appId, :appVer, :userId, :tags, :data

    def ver
      @ver ||= 1
    end

    def sample_rate
      @sampleRate ||= 100.0
    end

    def tags
      @tags ||= {}
    end
  end
end
