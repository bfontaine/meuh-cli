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

class FakeHTMLElement
  attr_reader :text
  def initialize(text)
    @text = text
  end
end

class MeuhTests < Test::Unit::TestCase

  # == Meuh#version == #

  def test_meuh_version
    assert(Meuh.version =~ /^\d+\.\d+\.\d+/)
  end

  # == Meuh#url == #
  def test_meuh_url
    assert(Meuh.url =~ /^https?:\/\//)
  end

  # == Meuh#user_agent == #

  def test_meuh_ua
    assert(Meuh.user_agent =~ /^Meuh\/\d+\.\d+\.\d+/)
  end

  # == Meuh#text == #

  def test_meuh_text_empty
    e = FakeHTMLElement.new ''
    assert_equal('', Meuh.text(e))
  end

  def test_meuh_text_spaces
    e = FakeHTMLElement.new '   '
    assert_equal('', Meuh.text(e))
  end

  def test_meuh_text_strip
    txt = ' foobar  '
    e = FakeHTMLElement.new txt
    assert_equal(txt.strip, Meuh.text(e))
  end

  def test_meuh_text_newlines1
    txt = "foo\rbar"
    e = FakeHTMLElement.new txt
    assert_equal(txt.sub(/\r/, "\n"), Meuh.text(e))
  end

  def test_meuh_text_newlines2
    txt = "foo\nbar"
    e = FakeHTMLElement.new txt
    assert_equal(txt, Meuh.text(e))
  end

  def test_meuh_text
    txt = 'foobar'
    e = FakeHTMLElement.new txt
    assert_equal(txt, Meuh.text(e))
  end

end


exit Test::Unit::AutoRunner.run
