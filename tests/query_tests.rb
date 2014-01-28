# -*- coding: UTF-8 -*-

require File.dirname(__FILE__) + '/fake_responses'

class Meuh_query_test < Test::Unit::TestCase

  def setup
    @url = Meuh.url
  end

  def test_keys
    t = Meuh.tracks

    assert(t.has_key?(:previous))
    assert(t.has_key?(:current))
    assert(t.has_key?(:next))
  end

  def test_next_track
    next_ary = Meuh.tracks[:next]

    assert_equal(1, next_ary.count)
    nextt = next_ary.first

    assert(nextt.is_a?(Hash))
    assert(nextt.has_key?(:artist))
    assert(nextt.has_key?(:album))
    assert(nextt.has_key?(:title))
    assert(nextt.has_key?(:time))

    assert_equal('Foo',    nextt[:artist])
    assert_equal('FooBar', nextt[:album])
    assert_equal('Bar',    nextt[:title])
    assert_equal('',       nextt[:time])

  end

end
