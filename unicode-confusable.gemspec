# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/unicode/confusable/constants"

Gem::Specification.new do |gem|
  gem.name          = "unicode-confusable"
  gem.version       = Unicode::Confusable::VERSION
  gem.summary       = "Detect characters that look visually similar."
  gem.description   = "[Unicode #{Unicode::Confusable::UNICODE_VERSION}] Compares two strings if they are visually confusable as described in Unicode® Technical Standard #39: Both strings get transformed into a skeleton format before comparing them. The skeleton is generated by normalizing the string, replacing confusable characters, and then normalizing the string again."
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["hi@ruby.consulting"]
  gem.homepage      = "https://github.com/janlelis/unicode-confusable"
  gem.license       = "MIT"

  gem.files         = Dir["{**/}{.*,*}"].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.2"
end
