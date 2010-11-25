require 'test_helper'

class DeliveredOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delivered_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivered_order" do
    assert_difference('DeliveredOrder.count') do
      post :create, :delivered_order => { }
    end

    assert_redirected_to delivered_order_path(assigns(:delivered_order))
  end

  test "should show delivered_order" do
    get :show, :id => delivered_orders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => delivered_orders(:one).to_param
    assert_response :success
  end

  test "should update delivered_order" do
    put :update, :id => delivered_orders(:one).to_param, :delivered_order => { }
    assert_redirected_to delivered_order_path(assigns(:delivered_order))
  end

  test "should destroy delivered_order" do
    assert_difference('DeliveredOrder.count', -1) do
      delete :destroy, :id => delivered_orders(:one).to_param
    end

    assert_redirected_to delivered_orders_path
  end
end
