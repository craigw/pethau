# -*- encoding: utf-8 -*-
lib = File.expand_path '../lib/', __FILE__
$:.unshift lib unless $:.include? lib

require 'pethau/version'

Gem::Specification.new do |s|
  s.name        = "pethau"
  s.version     = Pethau::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Craig R Webster"]
  s.email       = ["craig@barkingiguana.com"]
  s.summary     = "Useful bits of code that we use in lots of projects"
  s.description = "Extracting a bunch of code that we use across our " +
    "projects. In less awesome teams this would be the utility package."

  s.files        = Dir.glob("lib/**/*") + %w(README.md)
  s.require_path = 'lib'
end
