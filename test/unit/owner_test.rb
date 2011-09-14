require 'test_helper'

class OwnerTest < ActiveSupport::TestCase
  
  def setup
    @attrs = {
      :first_name => 'First',
      :last_name => 'Last',
      :address => '1234 Address Lane',
      :city => 'NeverNeverLand',
      :telephone => '123-456-7890'
    }
  end
  
  test "should not save without a first_name" do
    @attrs.delete :first_name
    owner = Owner.new @attrs
    assert !owner.save
  end
  
  test "should not save without a last_name" do
    @attrs.delete :last_name
    owner = Owner.new @attrs
    assert !owner.save
  end
  
  test "should not save without an address" do
    @attrs.delete :address
    owner = Owner.new @attrs
    assert !owner.save
  end
  
  test "should not save without a city" do
    @attrs.delete :city
    owner = Owner.new @attrs
    assert !owner.save
  end
  
  test "should not save without a telephone" do
    @attrs.delete :telephone
    owner = Owner.new @attrs
    assert !owner.save
  end
  
  test "should find owners by last name" do
    owners = Owner.find_by_last_name "Smith"
    owners.each do |owner|
      assert owner.last_name =~ /Smith/
    end
    assert owners.size == 3
  end
  
  test "should return empty results if name not found" do
    owners = Owner.find_by_last_name "Murphy"
    assert owners.size == 0
  end
  
  test "should return all owners if name is blank" do
    owners = Owner.find_by_last_name ""
    assert owners.size == 5
  end
  
  test "should find all owners if search is empty or nil" do
    owners = Owner.find_by_last_name nil
    assert owners.size == 5
  end
  
end
