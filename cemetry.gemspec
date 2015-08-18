# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cemetry/version'

Gem::Specification.new do |spec|
  spec.name          = "cemetry"
  spec.version       = Cemetry::VERSION
  spec.authors       = ["Hirofumi Wakasugi"]
  spec.email         = ["baenej@gmail.com"]
  spec.summary       = %q{Send OSC message persistently based on a given proc object.}
  spec.description   = %q{Send OSC message persistently based on a given proc object.}
  spec.homepage      = "https://github.com/5t111111/cemetry"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "miserable", "~> 0.0"
  spec.add_dependency "osc-ruby"
  spec.add_dependency "noone"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
