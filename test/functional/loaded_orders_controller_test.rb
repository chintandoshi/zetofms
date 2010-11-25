require 'test_helper'

class LoadedOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loaded_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loaded_order" do
    assert_difference('LoadedOrder.count') do
      post :create, :loaded_order => { }
    end

    assert_redirected_to loaded_order_path(assigns(:loaded_order))
  end

  test "should show loaded_order" do
    get :show, :id => loaded_orders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => loaded_orders(:one).to_param
    assert_response :success
  end

  test "should update loaded_order" do
    put :update, :id => loaded_orders(:one).to_param, :loaded_order => { }
    assert_redirected_to loaded_order_path(assigns(:loaded_order))
  end

  test "should destroy loaded_order" do
    assert_difference('LoadedOrder.count', -1) do
      delete :destroy, :id => loaded_orders(:one).to_param
    end

    assert_redirected_to loaded_orders_path
  end
end
