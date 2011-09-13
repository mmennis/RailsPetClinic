require 'test_helper'

class PetsControllerTest < ActionController::TestCase
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post :create, :pet => @pet.attributes
    end

    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should show pet" do
    get :show, :id => @pet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pet.to_param
    assert_response :success
  end

  test "should update pet" do
    put :update, :id => @pet.to_param, :pet => @pet.attributes
    assert_redirected_to pet_path(assigns(:pet))
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete :destroy, :id => @pet.to_param
    end

    assert_redirected_to pets_path
  end
end
