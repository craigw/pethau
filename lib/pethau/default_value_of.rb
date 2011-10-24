module Pethau
  module DefaultValueOf
    def self.included into
      into.extend ClassMethods
    end

    module ClassMethods
      def default_value_of attribute_name, default_value = nil, &builder
        if default_value && block_given?
          raise "Only provide one of default value or builder" 
        end

        getter_with_default = "#{attribute_name}_with_default"
        getter_without_default = "#{attribute_name}_without_default"
        alias_method getter_without_default, attribute_name

        define_method getter_with_default do
          original_value = send getter_without_default
          return original_value unless original_value.nil?
          return builder.call if block_given?
          default_value
        end
        alias_method attribute_name, getter_with_default
      end
      private :default_value_of
    end
  end
end
