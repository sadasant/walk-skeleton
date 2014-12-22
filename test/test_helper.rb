
$LOAD_PATH.unshift "./out"

require 'da_funk'

DaFunk::Test.configure do |t|
  t.root_path = File.join(File.dirname(File.expand_path(__FILE__)), "..")

  if t.mruby?
    t.libs = ["main.mrb"]
  else
    t.libs = FileList[File.join(t.root_path, 'lib/**/*.rb')]
  end
end

