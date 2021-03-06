# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whatimean/version'

Gem::Specification.new do |spec|
  spec.name          = "whatimean"
  spec.version       = WhatIMean::VERSION
  spec.authors       = ["Joao Fraga"]
  spec.email         = ["jgfraga@gmail.com"]

  spec.summary       = %q{Discover the correct typo of a word using Google search.}
  spec.description   = %q{Discover the correct typo of a word using Google search.}
  spec.homepage      = "https://github.com/joaofraga/whatimean"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "codeclimate-test-reporter"
end
