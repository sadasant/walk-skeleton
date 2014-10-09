class TestHelper
  if Object.const_defined?(:MTest)
    def self.case
      engine::TestCase
    end

    def self.engine
      MTest::Unit
    end

    def self.run
      engine.new.run
    end

    def self.setup
      path = File.dirname(File.realpath(__FILE__))

      require path + '/../out/simplehttp.mrb'
      require path + '/../out/da_funk.mrb'
      require path + '/../out/skeleton.mrb'
    end
  else
    def self.case
      engine::TestCase
    end

    def self.engine
      Test::Unit
    end

    def self.run; end

    def self.setup
      require 'fileutils'
      require 'test/unit' if ENV["RUBY_PLATFORM"] != "mruby"

      require 'simplehttp'
      require 'da_funk'

      path = File.dirname(File.realpath(__FILE__))

      require path + '/../lib/skeleton.rb'
    end
  end
end

TestHelper.setup

