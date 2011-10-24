class TestInitializeWith < MiniTest::Unit::TestCase
  def test_initialize_with_and_default_value_of_work_together
    klass = Class.new do
      include Pethau::InitializeWith
      include Pethau::DefaultValueOf
      initialize_with :foo, :bar
      default_value_of :bar do 2 end
      public :foo, :bar
    end

    instance = klass.new 1

    assert_equal 1, instance.foo
    assert_equal 2, instance.bar
  end
end
