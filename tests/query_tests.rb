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

  def test_current_track
    curr = Meuh.tracks[:current]

    assert(curr.is_a?(Hash))
    assert(curr.has_key?(:artist))
    assert(curr.has_key?(:album))
    assert(curr.has_key?(:title))
    assert(curr.has_key?(:time))

    assert_equal(nil,             curr[:artist])
    assert_equal('CurrBar',       curr[:album])
    assert_equal('Current Track', curr[:title])
    assert_equal('00:01:02',      curr[:time])
  end

  def test_previous_tracks
    prev_ary = Meuh.tracks[:previous]

    assert_equal(3, prev_ary.count)

    assert(prev_ary[0].is_a?(Hash))
    assert(prev_ary[1].is_a?(Hash))
    assert(prev_ary[2].is_a?(Hash))

    prev1 = prev_ary[0]

    assert(prev1.is_a?(Hash))
    assert(prev1.has_key?(:artist))
    assert(prev1.has_key?(:album))
    assert(prev1.has_key?(:title))
    assert(prev1.has_key?(:time))

    assert_equal('Artist1',  prev1[:artist])
    assert_equal('Album1',   prev1[:album])
    assert_equal('Track1',   prev1[:title])
    assert_equal('00:01:01', prev1[:time])

    prev2 = prev_ary[1]
    assert_equal('Artist2',  prev2[:artist])
    assert_equal('Album2',   prev2[:album])
    assert_equal('Track2',   prev2[:title])
    assert_equal('00:01:00', prev2[:time])

    prev3 = prev_ary[2]
    assert_equal('Artist3',  prev3[:artist])
    assert_equal('Album3',   prev3[:album])
    assert_equal('Track3',   prev3[:title])
    assert_equal('00:00:45', prev3[:time])
  end

end
