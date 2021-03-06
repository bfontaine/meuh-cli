# meuh

[![Build Status](https://travis-ci.org/bfontaine/meuh-cli.png?branch=master)](https://travis-ci.org/bfontaine/meuh-cli)
[![Gem Version](https://badge.fury.io/rb/meuh.png)](http://badge.fury.io/rb/meuh)
[![Coverage Status](https://coveralls.io/repos/bfontaine/meuh-cli/badge.png)](https://coveralls.io/r/bfontaine/meuh-cli)
[![Dependency Status](https://gemnasium.com/bfontaine/meuh-cli.png)](https://gemnasium.com/bfontaine/meuh-cli)

**meuh** is a command-line tool to check the current radio track at
[Anticafé][anticafe].

[anticafe]: http://anticafe.fr/en

## Install

```
gem install meuh
```

Windows users: You will need the Win32 Console ANSI gem for the colored output.
Install it with `gem install win32console`.

## Usage

From the command-line:

```
$ meuh
```

That's it! Add `--no-format` if you don’t want the fancy formatting.

## Example

```
$ meuh
Mauvaise Mine (Lafayette - Mauvaise Mine (Jupiter remix))

Previously:
* [15:44:21] Tsugi 30 LCD Soundsystem Small Wave (Dolle Jolle - Balearic Incarnation (Todd Terje's Extra Doll Mx))
* [15:37:31] Booker T & the MGs (Green Onions (Luke Danfields Bluehouse Edit))
* [15:33:42] Patchworks Remix Book (Mr Day - Small Fry ( Patchworks Disco mix) - Mr Day)
* [15:28:11] Midnight Riot Volume 4 (Yambee - Blacker (Joey Negro remix))

Next:
* Psychic (Darkside - The Only Shrine I've Seen)
```

## Tests

```
$ git clone https://github.com/bfontaine/meuh-cli.git
$ cd meuh-cli
$ bundle install
$ rake test
```

It’ll generate a `coverage/index.html`, which you can open in a Web browser.
