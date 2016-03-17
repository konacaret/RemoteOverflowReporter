# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RemoteOverflowReporter/version'

Gem::Specification.new do |spec|
  spec.name          = "RemoteOverflowReporter"
  spec.version       = RemoteOverflowReporter::VERSION
  spec.authors       = ["Kona Caret"]
  spec.email         = ["konacaret@gmail.com"]

  spec.summary       = %q{Generates 'tag'/category reports based on Stack Overflow Careers queries}
  spec.homepage      = "http://www.konacaret.com/RemoteOverflowReporter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["remote_overflow_reporter"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "aruba", "~> 0.14.0"
  spec.add_development_dependency "rspec", "~> 3.4"
end
