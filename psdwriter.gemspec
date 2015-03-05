# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'psdwriter/version'

Gem::Specification.new do |gem|
  gem.name          = "psdwriter"
  gem.version       = PSDWriter::VERSION
  gem.authors       = ["K-2052"]
  gem.email         = ["k@2052.me"]
  gem.description   = %q{A PSD format writer and parser}
  gem.summary       = %q{A PSD format writer and parser}
  gem.homepage      = "https://github.com/k2052/PSDWriter.rb"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/).delete_if { |f| f.include?('examples/') }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rake'
  gem.add_dependency 'bindata', '2.1.0'
  gem.add_dependency 'chunky_png'

  gem.test_files = Dir.glob("spec/**/*")
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'rb-fsevent', '~> 0.9'
end