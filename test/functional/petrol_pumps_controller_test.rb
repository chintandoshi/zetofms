require 'test_helper'

class PetrolPumpsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:petrol_pumps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create petrol_pump" do
    assert_difference('PetrolPump.count') do
      post :create, :petrol_pump => { }
    end

    assert_redirected_to petrol_pump_path(assigns(:petrol_pump))
  end

  test "should show petrol_pump" do
    get :show, :id => petrol_pumps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => petrol_pumps(:one).to_param
    assert_response :success
  end

  test "should update petrol_pump" do
    put :update, :id => petrol_pumps(:one).to_param, :petrol_pump => { }
    assert_redirected_to petrol_pump_path(assigns(:petrol_pump))
  end

  test "should destroy petrol_pump" do
    assert_difference('PetrolPump.count', -1) do
      delete :destroy, :id => petrol_pumps(:one).to_param
    end

    assert_redirected_to petrol_pumps_path
  end
end
