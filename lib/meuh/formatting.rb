# -*- coding: UTF-8 -*-

module Meuh
  module Formatting
    class << self

      # Format tracks for text output (e.g. in the terminal)
      def text(tracks, color=true)
        if color
          require 'colored'
          # this line is from github.com/defunkt/colored
          require 'Win32/Console/ANSI' if RUBY_PLATFORM =~ /win32/
        end
        s = []

        def track_text(t, style, color) # :previous, :next, :curr
          title    = t[:title]
          artist   = t[:artist]
          album    = t[:album]
          time     = style == :previous ? "[#{t[:time]}] " : ''

          title.strip!

          if color
            title = title.underline
            if artist and style == :curr
              artist = artist.cyan
            end
          end

          info = [artist, album].compact
          info = info.empty? ? '' : " (#{info.map(&:to_s).join(' - ')})"

          if style == :curr and color
            info = info.green
          end

          ts = "#{time}#{title}#{info}"

          ts = "* #{ts}" unless style == :curr

          ts
        end

        if tracks[:current]
          s << track_text(tracks[:current], :curr, color)
        end

        if tracks[:previous] and !tracks[:previous].empty?
          s << "\nPreviously:"
          tracks[:previous].each do |t|
            s << track_text(t, :previous, color)
          end
        end

        if tracks[:next] and !tracks[:next].empty?
          s << "\nNext:"
          tracks[:next].each do |t|
            s << track_text(t, :next, color)
          end
        end

        s.join("\n")
      end
    end
  end
end
