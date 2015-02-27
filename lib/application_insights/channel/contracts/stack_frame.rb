require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class StackFrame
    include JsonSerializable

    attributes :level, :method, :assembly, :fileName, :line
  end
end
