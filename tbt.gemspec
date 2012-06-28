# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tbt/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["John Gesimondo"]
  gem.email         = ["john@jmondo.com"]
  gem.description   = %q{tbt: This Before That is an rspec assertion for request specs to assert that one piece of content appears on the page before another.}
  gem.summary       = %q{Assert that this is before that}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.name          = "tbt"
  gem.require_paths = ["lib"]
  gem.version       = Tbt::VERSION

  gem.rubyforge_project = "tbt"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "capybara"
  gem.add_development_dependency "mocha"
end
