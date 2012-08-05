# -*- encoding: utf-8 -*-
require File.expand_path('../lib/shakyo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Yusuke Kawamoto"]
  gem.email         = ["novogrammer@gmail.com"]
  gem.description   = %q{Script for sourcecode transcription}
  gem.summary       = %q{Script for sourcecode transcription}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
#  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.executables   = ["shakyo"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "shakyo"
  gem.require_paths = ["lib"]
  gem.version       = Shakyo::VERSION
  gem.required_ruby_version = '>= 1.9.3'

end
