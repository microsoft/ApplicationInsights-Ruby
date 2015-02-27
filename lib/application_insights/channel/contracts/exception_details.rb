require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class ExceptionDetails
    include JsonSerializable

    attributes :id, :outerId, :typeName, :message, :hasFullStack, :stack, :parsedStack

    def has_full_stack
      @hasFullStack.nil? ? true : @hasFullStack
    end

    def parsed_stack
      @parsedStack ||= []
    end
  end
end
