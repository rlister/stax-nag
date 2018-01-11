lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stax/nag/version"

Gem::Specification.new do |spec|
  spec.name          = "stax-nag"
  spec.version       = Stax::Nag::VERSION
  spec.authors       = ['Richard Lister']
  spec.email         = ["rlister@gmail.com"]

  spec.summary       = %q{Integrate cfn_nag with stax.}
  spec.description   = %q{Run cfn_nag linting on stax-controlled cloudformation templates.}
  spec.homepage      = 'https://github.com/rlister/stax-nag'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency('stax')
  spec.add_dependency('cfn-nag')
end