require_relative 'json_serializable'
require_relative 'data_point_type'

module ApplicationInsights::Channel::Contracts
  class DataPoint
    include JsonSerializable

    attributes :name, :kind, :value, :count, :min, :max, :stdDev

    def kind
      @kind ||= DataPointType::MEASUREMENT
    end
  end
end
