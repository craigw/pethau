module Pethau
  module PrivateAttrAccessor
    def self.included into
      into.extend ClassMethods
    end

    module ClassMethods
      def private_attr_accessor *attribute_names
        attr_accessor *attribute_names
        attribute_names.each do |attribute_name|
          private attribute_name, "#{attribute_name}="
        end
      end
      private :private_attr_accessor
    end
  end
end
