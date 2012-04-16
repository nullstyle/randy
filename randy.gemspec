# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "randy/version"

Gem::Specification.new do |s|
  s.name        = "randy"
  s.version     = Randy::VERSION
  s.authors     = ["Scott Fleckenstein"]
  s.email       = ["nullstyle@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{PRNG and probability distribution helpers}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "randy"
  s.required_ruby_version = '>= 1.9.3'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", ">= 2.9.0"
  s.add_development_dependency "ZenTest"

  s.add_runtime_dependency "activesupport", ">= 3.1.0"
  s.add_runtime_dependency "ruby-sdl-ffi",  "~> 0.4"
  s.add_runtime_dependency "rubygame",      "~> 2.6.4"
end
