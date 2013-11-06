# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "ffi-soil2"
  s.version     = "0.0.1"
  s.authors     = ["lian"]
  s.email       = ["meta.rb@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{ffi-soli2}
  s.description = %q{ffi-soli2}
  s.homepage    = "https://github.com/lian/ffi-soli2"

  s.rubyforge_project = "ffi-soli2"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_rubygems_version = ">= 1.3.6"
  #s.add_development_dependency "bacon"

  s.add_runtime_dependency "ffi"
end
