#!/usr/bin/env rake

require 'rake'
require 'fileutils'
require 'rake/testtask'
require 'bundler/setup'

SKELETON_ROOT = File.dirname(File.expand_path(__FILE__))
SKELETON_OUT  = File.join(SKELETON_ROOT, "out", "skeleton.mrb")

task :default => :build

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*test.rb']
  t.verbose = true
end

task :check do
  if ENV["MRBC"].nil? && ! system("type mrbc > /dev/null 2>&1 ")
    puts "$MRBC isn't set or mrbc isn't on $PATH"
    exit 0
  end
end

desc "Compile skeleton to mrb"
task :build => :check do
  sh "mkdir -p #{File.join(SKELETON_ROOT, "out")}"
  if ENV["MRBC"]
    sh "#{ENV["MRBC"]} -o #{SKELETON_OUT} #{File.join(SKELETON_ROOT, "lib", "skeleton.rb")} "
  else
    sh "env mrbc -o #{SKELETON_OUT} #{File.join(SKELETON_ROOT, "lib", "skeleton.rb")} "
  end
end

desc "Clobber/Clean"
task :clean => :check do
  sh "mkdir -p out"
  sh "rm -f #{SKELETON_OUT}"
end

desc "Run all test on mruby"
task :mtest => :check do
  ENV["RUBY_PLATFORM"] = "mruby"
  FileUtils.mkdir_p "out"
  require File.dirname(File.realpath(__FILE__)) + '/test/test_helper.rb'

  Bundler.load.specs.each do |gem|
    sh "cp #{File.join(gem.full_gem_path, "out", gem.name)}.mrb out/#{gem.name}.mrb" if File.exists? "#{File.join(gem.full_gem_path, "out", gem.name)}.mrb"
  end
  skeleton_files = FileList['lib/**/*']
  files = FileList["test/test_helper.rb"] + FileList['test/**/*test.rb'] + ["test/test_run.rb"]
  if system("mrbc -o out/skeleton.mrb #{skeleton_files.uniq}") && system("mrbc -o out/test.mrb #{files.uniq}")
    system("mruby -b out/test.mrb")
  end
end
