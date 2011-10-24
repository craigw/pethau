class TestDefaultValueOf < MiniTest::Unit::TestCase
  def test_default_value_of_returns_default_value_when_not_set
    klass = Class.new do
      include Pethau::DefaultValueOf
      attr_accessor :foo
      default_value_of :foo do "HELLO, WORLD" end
    end
  
    instance = klass.new
  
    assert_equal "HELLO, WORLD", instance.foo
  end

  def test_default_value_of_returns_default_value_when_literal_given
    klass = Class.new do
      include Pethau::DefaultValueOf
      attr_accessor :foo
      default_value_of :foo, "HELLO, WORLD"
    end
  
    instance = klass.new
  
    assert_equal "HELLO, WORLD", instance.foo
  end
  
  def test_default_value_of_returns_set_value_when_provided
    klass = Class.new do
      include Pethau::DefaultValueOf
      attr_accessor :foo
      default_value_of :foo do "HELLO, WORLD" end
    end
  
    instance = klass.new
    instance.foo = "GOODBYE!"
    assert_equal "GOODBYE!", instance.foo
  end

  def test_default_value_of_returns_nil_when_nil_value_passed
    klass = Class.new do
      include Pethau::DefaultValueOf
      attr_accessor :foo
      default_value_of :foo do "Yo!" end
    end

    instance = klass.new
    instance.foo = nil
    assert_nil instance.foo
  end
end
