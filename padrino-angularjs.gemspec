# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'padrino/angularjs/version'

Gem::Specification.new do |gem|
  gem.name          = "padrino-angularjs"
  gem.version       = Padrino::Angularjs::VERSION
  gem.authors       = ["Takeshi Yabe"]
  gem.email         = ["tyabe@nilidea.com"]
  gem.description   = %q{This gem to use AngularJS to a Padrino apps}
  gem.summary       = %q{AngularJS on Padrino}
  gem.homepage      = "https://github.com/tyabe/padrino-angularjs#readme"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end
