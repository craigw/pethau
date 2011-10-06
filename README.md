# Pethau

A bunch of code that we find useful to share amongst our projects.

This is the place that code lives when it doesn't have a larger purpose; in
less awesome teams this would be the "utility" package.

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

I've been doing this for a while now, and I believe it's established itself as
enough of a pattern that I want to pull out the implementation and DRY it up:

    class Foo
      include Pethau::InitializeWith
      initialize_with :foo, :bar
    end

ince this is used in a lot of places in my projects I tend to include it in
`Object` but I didn't want to make that decision for you.
