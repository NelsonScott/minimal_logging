# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minimal_logging/version'

Gem::Specification.new do |spec|
  spec.name          = "minimal_logging"
  spec.version       = MinimalLogging::VERSION
  spec.authors       = ["Scott Nelson"]
  spec.email         = ["Scott.D.Nelson@dartmouth.edu"]
  spec.summary       = %q{Replace the default Rails Server log with shorter and more readable output.}
  spec.description   = %q{Replace the default Rails Server log with shorter and more readable output.}
  spec.homepage      = "https://github.com/NelsonScott/minimal_logging"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "awesome_print", "~> 1.6"
  spec.add_dependency "colorize", "~> 0.7"
end
