require 'test_helper'

class VetSpecialtiesControllerTest < ActionController::TestCase
  setup do
    @vet_specialty = vet_specialties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vet_specialties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vet_specialty" do
    assert_difference('VetSpecialty.count') do
      post :create, :vet_specialty => @vet_specialty.attributes
    end

    assert_redirected_to vet_specialty_path(assigns(:vet_specialty))
  end

  test "should show vet_specialty" do
    get :show, :id => @vet_specialty.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vet_specialty.to_param
    assert_response :success
  end

  test "should update vet_specialty" do
    put :update, :id => @vet_specialty.to_param, :vet_specialty => @vet_specialty.attributes
    assert_redirected_to vet_specialty_path(assigns(:vet_specialty))
  end

  test "should destroy vet_specialty" do
    assert_difference('VetSpecialty.count', -1) do
      delete :destroy, :id => @vet_specialty.to_param
    end

    assert_redirected_to vet_specialties_path
  end
end
