# Unicode::Confusable [![[version]](https://badge.fury.io/rb/unicode-confusable.svg)](http://badge.fury.io/rb/unicode-confusable)  [![[travis]](https://travis-ci.org/janlelis/unicode-confusable.png)](https://travis-ci.org/janlelis/unicode-confusable)

Compares two strings if they are visually confusable as described in [Unicode® Technical Standard #39](http://www.unicode.org/reports/tr39/#Confusable_Detection): Both strings get transformed into a skeleton format before comparing them. The skeleton is generated by normalizing the string ([NFD](http://unicode.org/reports/tr15/#Norm_Forms)), replacing [confusable characters](ftp://ftp.unicode.org/Public/security/8.0.0/confusables.txt), and normalizing the string again.

Unicode version: **8.0.0**

Supported Rubies: **2.3**, **2.2**

## Usage

```ruby
require "unicode/confusable"

Unicode::Confusable.confusable? "a", "b" # => false
Unicode::Confusable.confusable? "C", "С" # => true
Unicode::Confusable.confusable? "ℜ𝘂ᖯʏ", "Ruby" # => true
Unicode::Confusable.confusable? "Michael", "Michae1" # => true
Unicode::Confusable.confusable? "⁇", "?" # => false
Unicode::Confusable.confusable? "⁇", "??" # => true
```

### Skeleton

```ruby
Unicode::Confusable.skeleton "ℜ𝘂ᖯʏ" # => "Ruby"
```

**Please note:** The skeleton is an intermediate representation, not meant for any other use than testing confusability, [according to the standard](http://www.unicode.org/reports/tr39/#Confusable_Detection).

## No Advanced Detection

TR 39 also describes mechanisms for a more exact recognition of confusables, also within the same string:

- Single-script confusable
- Mixed-script confusable
- Whole-script confusable

This is currently **not** supported by this gem.

## MIT License

- Copyright (C) 2016 Jan Lelis <http://janlelis.com>. Released under the MIT license.
- Unicode data: http://www.unicode.org/copyright.html#Exhibit1
