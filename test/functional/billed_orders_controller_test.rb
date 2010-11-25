require 'test_helper'

class BilledOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billed_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create billed_order" do
    assert_difference('BilledOrder.count') do
      post :create, :billed_order => { }
    end

    assert_redirected_to billed_order_path(assigns(:billed_order))
  end

  test "should show billed_order" do
    get :show, :id => billed_orders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => billed_orders(:one).to_param
    assert_response :success
  end

  test "should update billed_order" do
    put :update, :id => billed_orders(:one).to_param, :billed_order => { }
    assert_redirected_to billed_order_path(assigns(:billed_order))
  end

  test "should destroy billed_order" do
    assert_difference('BilledOrder.count', -1) do
      delete :destroy, :id => billed_orders(:one).to_param
    end

    assert_redirected_to billed_orders_path
  end
end
