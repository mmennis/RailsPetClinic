require 'test_helper'

class SpecialtiesControllerTest < ActionController::TestCase
  setup do
    @specialty = specialties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specialties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specialty" do
    assert_difference('Specialty.count') do
      post :create, :specialty => @specialty.attributes
    end

    assert_redirected_to specialty_path(assigns(:specialty))
  end

  test "should show specialty" do
    get :show, :id => @specialty.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @specialty.to_param
    assert_response :success
  end

  test "should update specialty" do
    put :update, :id => @specialty.to_param, :specialty => @specialty.attributes
    assert_redirected_to specialty_path(assigns(:specialty))
  end

  test "should destroy specialty" do
    assert_difference('Specialty.count', -1) do
      delete :destroy, :id => @specialty.to_param
    end

    assert_redirected_to specialties_path
  end
end
