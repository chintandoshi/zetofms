require 'test_helper'

class ProductUnitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_unit" do
    assert_difference('ProductUnit.count') do
      post :create, :product_unit => { }
    end

    assert_redirected_to product_unit_path(assigns(:product_unit))
  end

  test "should show product_unit" do
    get :show, :id => product_units(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => product_units(:one).to_param
    assert_response :success
  end

  test "should update product_unit" do
    put :update, :id => product_units(:one).to_param, :product_unit => { }
    assert_redirected_to product_unit_path(assigns(:product_unit))
  end

  test "should destroy product_unit" do
    assert_difference('ProductUnit.count', -1) do
      delete :destroy, :id => product_units(:one).to_param
    end

    assert_redirected_to product_units_path
  end
end
