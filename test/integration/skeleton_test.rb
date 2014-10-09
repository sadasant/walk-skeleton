require File.dirname(File.realpath(__FILE__)) + '/../test_helper.rb' unless Object.const_defined?(:MTest)

class IntegrationSkeletonTest < TestHelper.case
  def test_true
    assert Skeleton.call
  end
end

if $ok_test && Object.const_defined?(:MTest)
  MTest::Unit.new.mrbtest
end
