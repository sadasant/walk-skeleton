class Main < Device
  def self.call
    puts "MAIIIIINNN!"
    getc
  end

  def self.foo
    :foo
  end

  def self.version
    "0.0.1"
  end
end

