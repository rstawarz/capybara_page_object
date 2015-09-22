# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara_page_object/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara_page_object"
  spec.version       = CapybaraPageObject::VERSION
  spec.authors       = ["Ryan Stawarz"]
  spec.email         = ["ryan@stawarz.com"]

  spec.summary       = %q{A Page Object Model to be used with capybara}
  spec.description   = %q{A simple library to abstract out page details from cucumber and browser tests}
  spec.homepage      = "http://github.com/rstawarz/capybara_page_object"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "capybara"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
