# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "restfulie-client/version"

Gem::Specification.new do |s|
	s.name        = "restfulie-client"
	s.version     = Restfulie::Client::VERSION.to_s
	s.platform    = Gem::Platform::RUBY
	s.authors     = ["Guilherme Silveira, Caue Guerra, Luis Cipriani, Everton Ribeiro, George Guimaraes, Paulo Ahagon, and many more!"]
	s.email       = %q{guilherme.silveira@caelum.com.br}
	s.homepage    = %q{http://restfulie.caelumobjects.com}
	s.summary     = %q{Hypermedia aware resource based library in ruby (client side) and ruby on rails (server side).}
	s.description = %q{restfulie-client}

	s.rubyforge_project = "restfulie-client"

	s.files         = `git ls-files`.split("\n")
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
	s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	s.require_paths = ["lib"]

  s.add_dependency("nokogiri", [">= 1.4.2"])
  s.add_dependency("json_pure", [">= 1.2.4"])
  s.add_dependency('medie', "~> 1.0.0")
end
