# -*- coding: UTF-8 -*-

class Meuh_formatting_test < Test::Unit::TestCase

  def setup
    @tracks = {
      :previous => [
        {
          :artist => 'Artist1',
          :album =>  'Album1',
          :title =>  'Track1',
          :time =>   '00:01:01',
        },
        {
          :artist => 'Artist2',
          :album =>  'Album2',
          :title =>  'Track2',
          :time =>   '00:01:00',
        },
        {
          :artist => 'Artist3',
          :album =>  'Album3',
          :title =>  'Track3',
          :time =>   '00:00:45',
        }
      ],
      :current => {
        :artist => nil,
        :album => 'CurrBar',
        :title => 'Current Track',
        :time => '00:01:02'
      },
      :next => [
        {
          :artist => 'Foo',
          :album  => 'FooBar',
          :title  => 'Bar',
          :time   => ''
        }
      ]
    }
  end

  def test_general_format_no_color
    r = /^.+\n\nPreviously:\n(?:\* \[.*?\] .*\n)+\nNext:\n\* .+/
    assert_not_nil(Meuh.format_results(@tracks, false) =~ r)
    assert_not_nil(Meuh.format_results(@tracks, true) =~ r)
  end

  def test_general_format_color
    r = /^.+\n\nPreviously:\n(?:\* \[.*?\] .*\n)+\nNext:\n\* .+/
    assert_not_nil(Meuh.format_results(@tracks, true) =~ r)
  end

  def test_general_format_color_with_curr_artist
    @tracks[:current][:artist] = 'Someone'
    r = /^.+\n\nPreviously:\n(?:\* \[.*?\] .*\n)+\nNext:\n\* .+/
    assert_not_nil(Meuh.format_results(@tracks, true) =~ r)
  end

  def test_color_reset
    assert_equal(nil, Meuh.format_results(@tracks, false).index("\e[0m"))
    assert_not_nil(Meuh.format_results(@tracks, true).index "\e[0m")
  end

end
