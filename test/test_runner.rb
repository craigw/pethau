require 'minitest/unit'
require 'minitest/autorun'

lib = File.expand_path '../../lib/', __FILE__
$:.unshift lib unless $:.include? lib
require 'pethau'

class MiniTest::Unit::TestCase
end

Dir[File.dirname(__FILE__) + '/**/test_*.rb'].each do |suite|
  require suite
end
