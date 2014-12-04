require_relative 'json_serializable'

module ApplicationInsights
  module Channel
    module Contracts
      # Data contract class for type DependencySourceType.
      class DependencySourceType
        # Enumeration value UNDEFINED.
        UNDEFINED = 0
        
        # Enumeration value AIC.
        AIC = 1
        
        # Enumeration value APMC.
        APMC = 2
      end
    end
  end
end
