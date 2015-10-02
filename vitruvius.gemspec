# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vitruvius/version'

Gem::Specification.new do |spec|
  spec.name          = "vitruvius"
  spec.version       = Vitruvius::VERSION
  spec.authors       = ["Joël Quenneville"]
  spec.email         = ["joelq@thoughtbot.com"]

  spec.summary       = %q{Vitruvius builds test fakes from schema files}
  spec.description   = %q{Vitruvius builds Sinatra test fakes from API schema files}
  spec.homepage      = "http://github.com/JoelQ/vitruvius"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
