## CHANGELOG

### 1.12.0

- Remove default ignorable codepoints, which is now part of the skeleton algorithm
- Fix the confusable list for ";" (wrongly contained null bytes)

### 1.11.0

- Unicode 16.0

### 1.10.0

- Unicode 15.1

### 1.9.0

- Unicode 15.0

### 1.8.0

- Unicode 14.0

### 1.7.0

- Unicode 13

### 1.6.0

* Unicode 12.1

### 1.5.0

* Unicode 12

### 1.4.0

* Unicode 11
* Do not depend on rubygems (only use zlib stdlib for unzipping)

### 1.3.2

* Explicitly load rubygems/util, fixes regression in 1.3.1

### 1.3.1

* Use `Gem::Util` for `gunzip`, removes deprecation warning

### 1.3.0

* Add Unicode::Confusable.list method which returns all confusables of given character

### 1.2.0

* Unicode 10

### 1.1.0

* Support Unicode 9.0

### 1.0.1

* Fix: Only load index if skeleton method is actually invoked

### 1.0.0

* Initial release

