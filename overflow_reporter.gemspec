# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'overflow_reporter/version'

Gem::Specification.new do |spec|
  spec.name          = "overflow_reporter"
  spec.version       = OverflowReporter::VERSION
  spec.authors       = ["Kona Caret"]
  spec.email         = ["konacaret@gmail.com"]

  spec.summary       = %q{Gem that creates command-line reports of Stack Overflow Careers listings.}
  spec.homepage      = "http://www.konacaret.com/overflow_reporter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["overflow_reporter"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "aruba", "~> 0.14.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.24"
end
