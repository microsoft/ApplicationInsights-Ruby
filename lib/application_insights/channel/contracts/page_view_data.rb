require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class PageViewData
    include JsonSerializable

    attributes :ver, :url, :name, :duration, :properties, :measurements

    def ver
      @ver ||= 2
    end

    def properties
      @properties ||= {}
    end

    def measurements
      @measurements ||= {}
    end
  end
end
