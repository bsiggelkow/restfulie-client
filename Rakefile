#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'restfulie-client'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

require 'jeweler'
require './lib/restfulie-client/version'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "restfulie-client"
  gem.version = Restfulie::Client::VERSION
  gem.summary = %Q{Hypermedia aware resource based library in ruby.}
  gem.description = %Q{restfulie-client}
  gem.email = "guilherme.silveira@caelum.com.br"
  gem.homepage = "http://restfulie.caelumobjects.com"
  gem.authors = ["Guilherme Silveira, Caue Guerra, Luis Cipriani, Everton Ribeiro, George Guimaraes, Paulo Ahagon, and many more!"]
  gem.files =
  gem.files.exclude 'spec/**/*'
end
Jeweler::RubygemsDotOrgTasks.new


task :default => :test
