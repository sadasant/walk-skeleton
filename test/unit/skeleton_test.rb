
require File.dirname(File.realpath(__FILE__)) + '/../test_helper.rb' unless Object.const_defined?(:MTest)

class SkeletonTest < TestHelper.case
  def test_foo
    assert_equal :foo, Skeleton.foo
  end
end

if $ok_test && Object.const_defined?(:MTest)
  MTest::Unit.new.mrbtest
end

