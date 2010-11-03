require 'test_helper'

class ConsignorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consignors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consignor" do
    assert_difference('Consignor.count') do
      post :create, :consignor => { }
    end

    assert_redirected_to consignor_path(assigns(:consignor))
  end

  test "should show consignor" do
    get :show, :id => consignors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => consignors(:one).to_param
    assert_response :success
  end

  test "should update consignor" do
    put :update, :id => consignors(:one).to_param, :consignor => { }
    assert_redirected_to consignor_path(assigns(:consignor))
  end

  test "should destroy consignor" do
    assert_difference('Consignor.count', -1) do
      delete :destroy, :id => consignors(:one).to_param
    end

    assert_redirected_to consignors_path
  end
end
