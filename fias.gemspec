# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fias/version'

Gem::Specification.new do |gem|
  gem.name          = "fias_parser"
  gem.version       = Kladr::VERSION
  gem.authors       = ["Ivan Goncharov"]
  gem.email         = ["revis0r.mob@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~> 2.13.0'
  gem.add_development_dependency "nokogiri"
  gem.add_development_dependency "paint"
end
