# -*- coding: UTF-8 -*-

require 'uri'
require 'open-uri'
require 'nokogiri'

require File.dirname(__FILE__) + '/meuh/formatting'

# This module provide some methods to scrape current tracks from radiomeuh.com
module Meuh
  class << self

    def version
      '0.1.2'
    end

    def url
      'http://www.radiomeuh.com/meuh/playlist/index.php'
    end

    def user_agent
      "Meuh/#{version} +github.com/bfontaine/meuh"
    end

    # Get the text of an element. This is an helper for internal usage.
    def text(el)
      el.text.strip.gsub(/\r/, "\n")
    rescue
      ''
    end

    # Query the website, parse the list of tracks and return a hash:
    # { :previous => [ <track> ],
    #   :current => <track>,
    #   :next => [ <track>, ... ]
    # }
    #
    # A track is also a hash:
    # { :artist => "...",
    #   :album => "...",
    #   :title => "...",
    #   :remaining => "...", <-- remaining time
    #   :time => "..." <-- time for previous tracks
    # }
    def tracks
      tracks = { :previous => [], :current => nil, :next => [] }

      html = open(url, 'User-Agent' => user_agent).read.encode!(Encoding::UTF_8)
      doc = Nokogiri::HTML(html)

      def parse_track t
        lines = t.inner_html.split(/<br\/?\s*>/).map do |l|
          l.gsub(/&amp;/, '&')
        end

        artist, title = lines[1].split(/\s+-\s+/, 2)

        unless title
          title = artist
          artist = nil
        end

        time = lines[0].strip

        {
          :artist => artist,
          :album => lines[2].strip,
          :title => title,
          :remaining => t.css('font').text.gsub(/^:\s+/, ''),
          :time => time == '...' ? '' : time
        }
      end

      got_current = false
      doc.css('tr > td + td').each do |td|
        if !got_current
          b = td.css('b').first
          if b
            got_current = true
            tracks[:current] = parse_track(b)
          else
            tracks[:next] << parse_track(td)
          end
        else
          tracks[:previous] << parse_track(td) unless td.text =~ /\(jingle\)/i
        end
      end

      tracks
    end

    # Format tracks for output
    def format_results(tracks, color=true)
      self::Formatting.text(tracks, color)
    end

  end
end
