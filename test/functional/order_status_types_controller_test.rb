require 'test_helper'

class OrderStatusTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_status_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_status_type" do
    assert_difference('OrderStatusType.count') do
      post :create, :order_status_type => { }
    end

    assert_redirected_to order_status_type_path(assigns(:order_status_type))
  end

  test "should show order_status_type" do
    get :show, :id => order_status_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => order_status_types(:one).to_param
    assert_response :success
  end

  test "should update order_status_type" do
    put :update, :id => order_status_types(:one).to_param, :order_status_type => { }
    assert_redirected_to order_status_type_path(assigns(:order_status_type))
  end

  test "should destroy order_status_type" do
    assert_difference('OrderStatusType.count', -1) do
      delete :destroy, :id => order_status_types(:one).to_param
    end

    assert_redirected_to order_status_types_path
  end
end
