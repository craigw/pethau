class TestPrivateAttrAccessor < MiniTest::Unit::TestCase
  def test_private_attr_accessor_creates_private_accessors
    klass = Class.new do
      include Pethau::PrivateAttrAccessor
      private_attr_accessor :foo
    end

    assert klass.private_instance_methods.include? :foo
    assert klass.private_instance_methods.include? :foo=
  end
end
