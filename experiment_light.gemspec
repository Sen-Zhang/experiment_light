# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'experiment_light/version'

Gem::Specification.new do |spec|
  spec.name          = "experiment_light"
  spec.version       = ExperimentLight::VERSION
  spec.authors       = ["Sen-Zhang"]
  spec.email         = ["solowolf21@gmail.com"]
  spec.summary       = %q{Feature Toggles for Rails}
  spec.description   = %q{Turn features on or off in various rails environments}
  spec.homepage      = "https://github.com/Sen-Zhang/experiment_light.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "jquery-rails"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", "~> 4.2.0"
  spec.add_development_dependency "rspec", "~> 3.3.0"
end
