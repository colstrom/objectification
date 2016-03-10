require_relative 'refinements/hash'

module Objectification
  class FromHash
    using Hash_types

    IGNORE = %w(to_h).freeze

    def initialize(properties = {})
      properties.each_pair do |key, value|
        self.class.method(:attr_accessor).call key
        instance_variable_set "@#{key}", value
      end
      self
    end

    def to_h
      instance_methods.each_with_object({}) do |instance_method, hash|
        hash[instance_method] = method(instance_method).call
      end
    end

    private

    def instance_methods
      ((self.class.instance_methods - self.class.private_methods) - Object.instance_methods)
        .map(&:to_s)
        .reject { |m| IGNORE.include? m }
        .reject { |m| m.start_with? '__' }
        .reject { |m| m.end_with? '=' }
    end

    def types
      to_h.types
    end
  end
end
