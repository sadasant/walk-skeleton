class Main < Device
  def self.call
    puts "MAIN2222"
    getc
  end

  def self.foo
    :foo
  end

  def self.version
    "0.0.1"
  end
end

