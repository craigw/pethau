module Pethau
  module DefaultValueOf
    def self.included into
      into.extend ClassMethods
      into.send :include, InstanceMethods
    end

    module InstanceMethods
      def value_set_cache
        @value_set_for ||= {}
      end
      private :value_set_cache

      def value_set_for attribute_name
        value_set_cache[attribute_name] = true
      end
      private :value_set_for

      def value_set_for? attribute_name
        !!value_set_cache[attribute_name]
      end
      private :value_set_for?
    end

    module ClassMethods
      def default_value_of attribute_name, default_value = nil, &builder
        if default_value && block_given?
          raise "Only provide one of default value or builder" 
        end
        default_value_setter_for attribute_name
        default_value_getter_for attribute_name, default_value, &builder
      end
      private :default_value_of

      def default_value_setter_for attribute_name
        setter_name = "#{attribute_name}="
        setter_with_recorder = "#{attribute_name}_with_recorder="
        setter_without_recorder = "#{attribute_name}_without_recorder="
        alias_method setter_without_recorder, setter_name

        define_method setter_with_recorder do |value|
          send setter_without_recorder, value
          value_set_for attribute_name
        end
        alias_method setter_name, setter_with_recorder
      end
      private :default_value_setter_for

      def default_value_getter_for attribute_name, default_value, &builder
        getter_with_default = "#{attribute_name}_with_default"
        getter_without_default = "#{attribute_name}_without_default"
        alias_method getter_without_default, attribute_name

        define_method getter_with_default do
          original_value = send getter_without_default
          return original_value if original_value
          return original_value if value_set_for? attribute_name
          return builder.call if block_given?
          default_value
        end
        alias_method attribute_name, getter_with_default
      end
      private :default_value_setter_for
    end
  end
end
