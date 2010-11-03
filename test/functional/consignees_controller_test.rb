require 'test_helper'

class ConsigneesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consignees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consignee" do
    assert_difference('Consignee.count') do
      post :create, :consignee => { }
    end

    assert_redirected_to consignee_path(assigns(:consignee))
  end

  test "should show consignee" do
    get :show, :id => consignees(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => consignees(:one).to_param
    assert_response :success
  end

  test "should update consignee" do
    put :update, :id => consignees(:one).to_param, :consignee => { }
    assert_redirected_to consignee_path(assigns(:consignee))
  end

  test "should destroy consignee" do
    assert_difference('Consignee.count', -1) do
      delete :destroy, :id => consignees(:one).to_param
    end

    assert_redirected_to consignees_path
  end
end
