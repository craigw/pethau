# Pethau

A bunch of code that we find useful to share amongst our projects.

This is the place that code lives when it doesn't have a larger purpose;
in less awesome teams this would be the "utility" package.

Pethau is Welsh for "things," which I think captures the general purpose
nature of this gem nicely.


## Things

### initialize\_with

A lot of my classes use the following initializer pattern:

    class Foo
      attr_accessor :bar
      private :bar=, :bar
      attr_accessor :baz
      private :baz=, :baz

      def initialize bar, baz
        self.bar = bar
        self.baz = baz
      end
    end

I've been doing this for a while now, and I believe it's established
itself as enough of a pattern that I want to pull out the implementation
and DRY it up:

    class Foo
      include Pethau::InitializeWith
      initialize_with :foo, :bar
    end

Since this is used in a lot of places in my projects I tend to include
it in `Object` but I didn't want to make that decision for you.


### default\_value\_of

It's useful to provide default values for attribute when they're not defined, but it's annoying to type code like this all the time:

    class Quux
      attr_writer :corge, :foo

      def corge
        @corge || "Default Value"
      end

      def foo
        @foo || FooBuilder.new.execute
      end
    end

Instead, I prefer this:

    class Quux
      attr_accessor :corge, :foo
      default_value_of :corge, "Default Value"
      default_value_of :foo do
        FooBuilder.new.execute
      end
    end

Combining it with InitializeWith yields a rather nice, readable, concise
class definition:

    class Grault
      initialize_with :garply, :waldo
      default_value_of :waldo do
        plugh = Plugh.new
        plugh.execute
      end
    end


### private\_attr\_accessor

I tend to avoid using instance variables where possible, my opinion
being that they couple you to the implementation of the class where
using accessors tie you only to the internal class interface - I've
found that the later makes it faster and easier to refactor my code.

Instead of typing this all the time:

    class Boggle
      attr_accessor :orf, :gin
      private :orf=, :orf, :gin=, :gin
    end

I can type this:

    class Boggle
      private_attr_accessor :orf, :gin
    end