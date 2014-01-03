# meuh

[![Build Status](https://travis-ci.org/bfontaine/meuh-cli.png?branch=master)](https://travis-ci.org/bfontaine/meuh-cli)

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
$ meuh [--no-color]
```

That's it!

## Example

TODO

## Tests

```
$ git clone https://github.com/bfontaine/meuh-cli.git
$ cd meuh-cli
$ bundle install
$ rake test
```

Set the `COVERAGE` environment variable to activate the code
coverage report, e.g.:

```
$ export COVERAGE=1; rake test
```


It’ll generate a `coverage/index.html`, which you can open in a
Web browser.
