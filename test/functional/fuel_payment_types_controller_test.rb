require 'test_helper'

class FuelPaymentTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fuel_payment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fuel_payment_type" do
    assert_difference('FuelPaymentType.count') do
      post :create, :fuel_payment_type => { }
    end

    assert_redirected_to fuel_payment_type_path(assigns(:fuel_payment_type))
  end

  test "should show fuel_payment_type" do
    get :show, :id => fuel_payment_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fuel_payment_types(:one).to_param
    assert_response :success
  end

  test "should update fuel_payment_type" do
    put :update, :id => fuel_payment_types(:one).to_param, :fuel_payment_type => { }
    assert_redirected_to fuel_payment_type_path(assigns(:fuel_payment_type))
  end

  test "should destroy fuel_payment_type" do
    assert_difference('FuelPaymentType.count', -1) do
      delete :destroy, :id => fuel_payment_types(:one).to_param
    end

    assert_redirected_to fuel_payment_types_path
  end
end
