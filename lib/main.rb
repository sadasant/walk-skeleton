require 'simplehttp'

class Main < Device
  def self.call
    puts "Card..."
    getc
    true
  end

  def self.foo
    :foo
  end

  def self.version
    "0.0.1"
  end
end

