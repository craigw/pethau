class TestDefaultValueOf < MiniTest::Unit::TestCase
  def test_default_value_of_returns_default_value_when_block_given
    klass = Class.new do
      include Pethau::DefaultValueOf
      attr_reader :foo
      default_value_of :foo do "HELLO, WORLD" end
    end
  
    instance = klass.new
    assert_equal "HELLO, WORLD", instance.foo
  end

  def test_default_value_of_returns_default_value_when_literal_given
    klass = Class.new do
      include Pethau::DefaultValueOf
      attr_reader :foo
      default_value_of :foo, "HELLO, WORLD"
    end
  
    instance = klass.new
    assert_equal "HELLO, WORLD", instance.foo
  end

  def test_default_value_of_returns_value_when_false_set
    klass = Class.new do
      include Pethau::DefaultValueOf
      attr_accessor :foo
      default_value_of :foo, true
    end
  
    instance = klass.new false
    instance.foo = false
  
    assert_equal false, instance.foo
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

  def test_default_value_of_returns_default_when_nil_value_set
    klass = Class.new do
      include Pethau::DefaultValueOf
      attr_accessor :foo
      default_value_of :foo, "Yo!"
    end

    instance = klass.new
    instance.foo = nil
    assert_equal "Yo!", instance.foo
  end
end
