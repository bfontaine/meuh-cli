# -*- coding: UTF-8 -*-

require 'fakeweb'

FakeWeb.allow_net_connect = false

here = File.expand_path(File.dirname(__FILE__))

URL = Meuh.url
IMG = '<img src=\'http://example.com/foo.jpg\''
BASE_HTML = File.read("#{here}/playlist.response.html")

def html(b)
  BASE_HTML.sub(/%s/, b)
end

def line(opts)
  <<-EOL.gsub(/\n+\s*/, '')
  <tr><td class='pochette'>#{opts[:img] || '&nbsp;'}</td>
    <td class='#{opts[:class] || 'Cell'}'>#{opts[:time] || '...'}
    <br>#{opts[:body]}</td></tr>
  EOL
end

def curr_track(opts)
  line(opts.merge({
    :class => 'TextCell',
    :time => "<B>#{opts[:time]}",
    :body => "#{opts[:body]}<BR><font style='font-size : 10px;'>: #{opts[:remaining]}</font></B>"
  }))
end

alias :prev_track :line
alias :next_track :line

def table(opts)
  [
    opts[:next].map { |t| next_track(t) },
    curr_track(opts[:curr]),
    opts[:prev].map { |t| prev_track(t) }
  ].flatten.join("\n")
end

t1 = table({
  :next => [
    {
    :img  => IMG,
    :body => 'Foo - Bar<br/>FooBar'
    }
  ],
  :curr => {
    :img => IMG,
    :remaining => '42s',
    :time => '00:01:02',
    :body => 'Current Track<br/>CurrBar'
  },
  :prev => [
    {
      :img => IMG,
      :time => '00:01:01',
      :body => 'Artist1 - Track1<br/>Album1'
    },
    {
      :img => IMG,
      :time => '00:01:00',
      :body => 'Artist2 - Track2<br/>Album2'
    },
    {
      :img => IMG,
      :time => '00:00:45',
      :body => 'Artist3 - Track3<br/>Album3'
    }
  ]
})

FakeWeb.register_uri(:get, URL, :body => html(t1))
