require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type SeverityLevel.
      class SeverityLevel
        # Enumeration value VERBOSE.
        VERBOSE = 0
        
        # Enumeration value INFORMATION.
        INFORMATION = 1
        
        # Enumeration value WARNING.
        WARNING = 2
        
        # Enumeration value ERROR.
        ERROR = 3
        
        # Enumeration value CRITICAL.
        CRITICAL = 4
      end
    end
  end
end
