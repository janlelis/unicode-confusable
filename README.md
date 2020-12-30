# Unicode::Confusable [![[version]](https://badge.fury.io/rb/unicode-confusable.svg)](https://badge.fury.io/rb/unicode-confusable)  [![[ci]](https://github.com/janlelis/unicode-confusable/workflows/Test/badge.svg)](https://github.com/janlelis/unicode-confusable/actions?query=workflow%3ATest)

Compares two strings if they are visually confusable as described in [Unicode® Technical Standard #39](https://www.unicode.org/reports/tr39/#Confusable_Detection): Both strings get transformed into a skeleton format before comparing them. The skeleton is generated by normalizing the string ([NFD](http://unicode.org/reports/tr15/#Norm_Forms)), replacing [confusable characters](https://unicode.org/Public/security/12.1.0/confusables.txt), and normalizing the string again.

Unicode version: **13.0.0** (March 2020)

Supported Rubies: **3.0**, **2.7**, **2.6**, **2.5**

Old Rubies which might still work: **2.4**, **2.3**, **2.2**

## Usage

### Confusable?

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

**Please note:** The skeleton is an intermediate representation, not meant for any other use than testing confusability, [according to the standard](https://www.unicode.org/reports/tr39/#Confusable_Detection).

### List

List all confusables of a specific character:

```ruby
Unicode::Confusable.list("o", false)
# => ["ం", "ಂ", "ം", "ං", "०", "੦", "૦", "௦", "౦", "೦", "൦", "๐", "໐", "၀", "٥", "۵", "ｏ", "ℴ", "𝐨", "𝑜", "𝒐", "𝓸", "𝔬", "𝕠", "𝖔", "𝗈", "𝗼", "𝘰", "𝙤", "𝚘", "ᴏ", "ᴑ", "ꬽ", "ο", "𝛐", "𝜊", "𝝄", "𝝾", "𝞸", "σ", "𝛔", "𝜎", "𝝈", "𝞂", "𝞼", "ⲟ", "о", "ჿ", "օ", "ס", "ه", "𞸤", "𞹤", "𞺄", "ﻫ", "ﻬ", "ﻪ", "ﻩ", "ھ", "ﮬ", "ﮭ", "ﮫ", "ﮪ", "ہ", "ﮨ", "ﮩ", "ﮧ", "ﮦ", "ە", "ഠ", "ဝ", "𐓪", "𑣈", "𑣗", "𐐬"]
```

If you omit the second parameter, it will also show confusables, where the given character is just a part of:

```ruby
Unicode::Confusable.list("o")
# => ["⒪", "ꜵ", "℅", "ᴔ", "ꭁ", "ꭂ", "ﷲ", "№", "ం", "ಂ", "ം", "ං", "०", "੦", "૦", "௦", "౦", "೦", "൦", "๐", "໐", "၀", "٥", "۵", "ｏ", "ℴ", "𝐨", "𝑜", "𝒐", "𝓸", "𝔬", "𝕠", "𝖔", "𝗈", "𝗼", "𝘰", "𝙤", "𝚘", "ᴏ", "ᴑ", "ꬽ", "ο", "𝛐", "𝜊", "𝝄", "𝝾", "𝞸", "σ", "𝛔", "𝜎", "𝝈", "𝞂", "𝞼", "ⲟ", "о", "ჿ", "օ", "ס", "ه", "𞸤", "𞹤", "𞺄", "ﻫ", "ﻬ", "ﻪ", "ﻩ", "ھ", "ﮬ", "ﮭ", "ﮫ", "ﮪ", "ہ", "ﮨ", "ﮩ", "ﮧ", "ﮦ", "ە", "ഠ", "ဝ", "𐓪", "𑣈", "𑣗", "𐐬", "ۿ", "ø", "ꬾ", "ɵ", "ꝋ", "ө", "ѳ", "ꮎ", "ꮻ", "ꭴ", "ﳙ", "ơ", "œ", "ɶ", "∞", "ꝏ", "ꚙ", "ﳗ", "ﱑ", "ﳘ", "ﱒ", "ﶓ", "ﶔ", "ﱓ", "ﱔ", "ൟ", "တ", "ꭣ", "ﲠ", "ﳢ", "ﲥ", "ﳤ", "ﷻ", "ﴱ", "ﳨ", "ﴲ", "ﳪ", "ﷺ", "ﷷ", "ﳍ", "ﳖ", "ﳯ", "ﳞ", "ﳱ", "ﳦ", "ﲛ", "ﳠ", "ﯭ", "ﯬ"]
```

## No Advanced Detection

TR 39 also describes mechanisms for a more exact recognition of confusables, also within the same string:

- Single-script confusable
- Mixed-script confusable
- Whole-script confusable

This is currently **not** supported by this gem.

See [unicode-x](https://github.com/janlelis/unicode-x) for more Unicode related micro libraries.

## MIT License

- Copyright (C) 2016-2020 Jan Lelis <https://janlelis.com>. Released under the MIT license.
- Unicode data: https://www.unicode.org/copyright.html#Exhibit1
