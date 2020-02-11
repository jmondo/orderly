# -*- encoding: utf-8 -*-
require File.expand_path('../lib/orderly/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["John Gesimondo"]
  gem.email         = ["john@jmondo.com"]
  gem.description   = %q{orderly: an rspec assertion for request specs to assert that one piece of content appears on the page before another.}
  gem.summary       = %q{Assert this is before that}
  gem.homepage      = "https://github.com/jmondo/orderly"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.name          = "orderly"
  gem.require_paths = ["lib"]
  gem.version       = Orderly::VERSION

  gem.rubyforge_project = "orderly"

  gem.add_dependency "rspec", ">= 2.14"
  gem.add_dependency "capybara", ">= 1.1"
  gem.add_development_dependency "mocha", "~> 1.1"
  gem.add_development_dependency "sinatra", "~> 1.4"
  gem.add_development_dependency "appraisal", "~> 1.0"
  gem.add_development_dependency "selenium-webdriver"
  gem.add_development_dependency "webdrivers"
end
