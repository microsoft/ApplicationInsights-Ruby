require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class StackFrame
    include JsonSerializable

    attr_accessor :level, :method, :assembly, :file_name, :line

    attribute_mapping(
      line: 'line',
      level: 'level',
      method: 'method',
      assembly: 'assembly',
      file_name: 'fileName'
    )
  end
end
