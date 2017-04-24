# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'tourvisor/version'

Gem::Specification.new do |spec|
  spec.name          = 'tourvisor'
  spec.version       = Tourvisor::VERSION
  spec.authors       = ['Sergey Tsvetkov']
  spec.email         = ['sergey.a.tsvetkov@gmail.com']

  spec.summary       = %q{Wrapper for an API provided by tourvisor.ru}
  spec.description   = %q{You can find detailed documentation for all available methods here: http://tourvisor.ru/xml/doc}
  spec.homepage      = 'https://github.com/kimrgrey/tourvisor'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
