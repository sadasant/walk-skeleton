#!/usr/bin/env rake

require 'rake'
require 'fileutils'
require 'rake/testtask'
require 'bundler/setup'

Bundler.require(:default)

Rake::TestTask.new do |t|
  t.libs << ["lib"]
  t.test_files = FileList['test/**/*test.rb']
  t.verbose = true
end

DaFunk::RakeTask.new :skeleton do |t|
  t.libs  = FileList['lib/**/*.rb']
  t.tests = FileList['test/**/*test.rb']
  t.mrbc  = "cloudwalk build"
  t.mruby = "cloudwalk run"
end
