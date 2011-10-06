module Pethau
  module InitializeWith
    def self.included into
      into.extend ClassMethods
    end

    module ClassMethods
      def initialize_with *args
	args.each do |attribute|
	  attr_accessor attribute
	  private attribute, "#{attribute}="
	end

	define_method :initialize do |*initial_args|
	  args.each do |arg|
	    send "#{arg}=", initial_args.shift
	  end
	end
      end
      private :initialize_with
    end
  end
end
