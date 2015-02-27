require 'json'

module ApplicationInsights
  module Channel
    module Contracts
      module JsonSerializable
        module ClassMethods
          attr_reader :key_prefix, :contract_attributes

          def prefix(prefix)
            @key_prefix = prefix
          end

          def attributes(*attributes)
            @contract_attributes = attributes

            # Define camelCase accessors and snake_case aliases for some attributes
            attr_accessor *attributes
            attributes.each do |attr|
              snake_attr = snake_case attr

              unless snake_attr == attr.to_s
                alias_method :"#{snake_attr}", attr
                alias_method :"#{snake_attr}=", :"#{attr}="
              end
            end
          end

          def snake_case(str)
            str.to_s.gsub(/([^A-Z])([A-Z]+)/,'\1_\2').downcase
          end
        end

        def self.included(klass)
          klass.extend JsonSerializable::ClassMethods
        end

        def initialize(attributes = {})
          attributes.each { |k, v| send(:"#{k}=", v) }
        end

        def to_h
          output = {}
          klass = self.class
          prefix = klass.key_prefix

          klass.contract_attributes.each do |attr|
            value = visit self.send(klass.snake_case(attr))
            is_empty = value.respond_to?(:empty?) && value.empty?

            unless value.nil? || is_empty
              output["#{prefix}#{attr}"] = value
            end
          end

          output
        end

        def to_json(args = {})
          JSON.generate self.to_h, args
        end

        private

        def visit(object)
          return unless object

          if object.is_a? Array
            object.map { |e| visit e }
          elsif object.is_a? Hash
            Hash[object.map { |k, v| [k, visit(v)] }]
          elsif object.respond_to? :to_h
            object.to_h
          else
            object
          end
        end
      end
    end
  end
end
