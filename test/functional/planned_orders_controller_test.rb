require 'test_helper'

class PlannedOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planned_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planned_order" do
    assert_difference('PlannedOrder.count') do
      post :create, :planned_order => { }
    end

    assert_redirected_to planned_order_path(assigns(:planned_order))
  end

  test "should show planned_order" do
    get :show, :id => planned_orders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => planned_orders(:one).to_param
    assert_response :success
  end

  test "should update planned_order" do
    put :update, :id => planned_orders(:one).to_param, :planned_order => { }
    assert_redirected_to planned_order_path(assigns(:planned_order))
  end

  test "should destroy planned_order" do
    assert_difference('PlannedOrder.count', -1) do
      delete :destroy, :id => planned_orders(:one).to_param
    end

    assert_redirected_to planned_orders_path
  end
end
