require 'test_helper'

class PetTypesControllerTest < ActionController::TestCase
  setup do
    @pet_type = pet_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_type" do
    assert_difference('PetType.count') do
      post :create, :pet_type => @pet_type.attributes
    end

    assert_redirected_to pet_type_path(assigns(:pet_type))
  end

  test "should show pet_type" do
    get :show, :id => @pet_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pet_type.to_param
    assert_response :success
  end

  test "should update pet_type" do
    put :update, :id => @pet_type.to_param, :pet_type => @pet_type.attributes
    assert_redirected_to pet_type_path(assigns(:pet_type))
  end

  test "should destroy pet_type" do
    assert_difference('PetType.count', -1) do
      delete :destroy, :id => @pet_type.to_param
    end

    assert_redirected_to pet_types_path
  end
end
