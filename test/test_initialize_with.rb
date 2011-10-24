class TestInitializeWith < MiniTest::Unit::TestCase
  def test_initialize_with_sets_variables_correctly
    klass = Class.new do
      include Pethau::InitializeWith
      initialize_with :foo, :bar
      public :foo, :bar
    end

    instance = klass.new 1, 2

    assert_equal 1, instance.foo
    assert_equal 2, instance.bar
  end

  def test_initialize_with_does_not_set_unspecified_variables
    klass = Class.new do
      include Pethau::InitializeWith
      initialize_with :foo, :bar, :baz
      public :foo, :bar, :baz
    end

    instance = klass.new 1, 2

    assert_equal 1, instance.foo
    assert_equal 2, instance.bar
    assert_equal nil, instance.baz
  end
end
