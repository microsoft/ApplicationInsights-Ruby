require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class Application
    include JsonSerializable

    attr_accessor :ver, :build

    attribute_mapping(
      ver: 'ai.application.ver',
      build: 'ai.application.build'
    )
  end
end
