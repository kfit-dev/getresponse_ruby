# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'get_response/version'

Gem::Specification.new do |spec|
  spec.name          = "getresponse_ruby"
  spec.version       = GetResponse::VERSION
  spec.authors       = ["Faizal Zakaria"]
  spec.email         = ["phaibusiness@gmail.com"]

  spec.summary       = "Get Response Ruby Library"
  spec.description   = "Get Response Ruby Library ..."
  spec.homepage      = "https://github.com/faizalzakaria/getresponse_ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", '~> 0.10.4'
  spec.add_development_dependency 'webmock'
  spec.add_runtime_dependency 'json', '~> 1.8.6'
  spec.add_runtime_dependency 'faraday', '~> 0.9.2'
end
