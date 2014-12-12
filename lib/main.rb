class Main < Device
  def self.call
    puts "Card..."
    tracks = IO.read_card(30000)
    Display.clear
    p tracks[:track1]
    p tracks[:track1]
    getc
  end

  def self.foo
    :foo
  end

  def self.version
    "0.0.1"
  end
end

