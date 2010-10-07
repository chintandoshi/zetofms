require 'test_helper'

class CustaccountsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custaccounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custaccount" do
    assert_difference('Custaccount.count') do
      post :create, :custaccount => { }
    end

    assert_redirected_to custaccount_path(assigns(:custaccount))
  end

  test "should show custaccount" do
    get :show, :id => custaccounts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => custaccounts(:one).to_param
    assert_response :success
  end

  test "should update custaccount" do
    put :update, :id => custaccounts(:one).to_param, :custaccount => { }
    assert_redirected_to custaccount_path(assigns(:custaccount))
  end

  test "should destroy custaccount" do
    assert_difference('Custaccount.count', -1) do
      delete :destroy, :id => custaccounts(:one).to_param
    end

    assert_redirected_to custaccounts_path
  end
end
