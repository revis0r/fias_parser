# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fias_parser/version'

Gem::Specification.new do |gem|
  gem.name          = "fias_parser"
  gem.version       = FiasParser::VERSION
  gem.authors       = ["Ivan Goncharov"]
  gem.email         = ["revis0r.mob@gmail.com"]
  gem.description   = %q{Fias xml parser}
  gem.summary       = %q{Parser for FIAS}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec', '~> 2.13.0'
  gem.add_development_dependency "nokogiri"
  gem.add_development_dependency "paint"
end
