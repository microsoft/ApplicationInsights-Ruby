require 'json'

module ApplicationInsights
  module Channel
    module Contracts     
      class JsonSerializable
        def initialize(defaults, values, options)
          @defaults = defaults
          @values = values
          if options != nil
            options.each do |key, value|
              self.send key.to_s + '=', value
            end
          end
        end

        def to_h
          output = {}
          @defaults.each do |key, default|
            if @values.key? key
              value = @values[key]
              value = default if value == nil
            elsif default
              value = default
            else
              next
            end

            if value.class == Array
              value_copy = []
              value.each do |item|
                item.respond_to?(:to_h) ? value_copy.push(item.to_h) : value_copy.push(item)
              end
              output[key] = value_copy if value_copy.length > 0
            elsif value.class == Hash
              value_copy = {}
              value.each do |item_key, item_value|
                (item_value.respond_to? :to_h) ? value_copy[item_key] = item_value.to_h : value_copy[item_key] = item_value
              end
              output[key] = value_copy if value_copy.length > 0
            elsif value.respond_to? :to_h
              value_copy = value.to_h
              output[key] = value_copy if value_copy.length > 0
            else
              output[key] = value
            end
          end
          output
        end

        def to_json(*)
          hash = self.to_h
          hash.to_json
        end
      end
    end
  end
end

