#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'test/unit'
require 'simplecov'

test_dir = File.expand_path( File.dirname(__FILE__) )

SimpleCov.start { add_filter '/tests/' } if ENV['COVERAGE']

require 'meuh'

for t in Dir.glob( File.join( test_dir,  '*_tests.rb' ) )
  require t
end

class MeuhTests < Test::Unit::TestCase

  # == Meuh#version == #

  def test_meuh_version
    assert(Meuh.version =~ /^\d+\.\d+\.\d+/)
  end

  # == Meuh#user_agent == #

  def test_meuh_ua
    assert(Meuh.user_agent =~ /^Meuh\/\d+\.\d+\.\d+/)
  end

end


exit Test::Unit::AutoRunner.run
