require 'test_helper'

class VmodelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vmodels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vmodel" do
    assert_difference('Vmodel.count') do
      post :create, :vmodel => { }
    end

    assert_redirected_to vmodel_path(assigns(:vmodel))
  end

  test "should show vmodel" do
    get :show, :id => vmodels(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => vmodels(:one).to_param
    assert_response :success
  end

  test "should update vmodel" do
    put :update, :id => vmodels(:one).to_param, :vmodel => { }
    assert_redirected_to vmodel_path(assigns(:vmodel))
  end

  test "should destroy vmodel" do
    assert_difference('Vmodel.count', -1) do
      delete :destroy, :id => vmodels(:one).to_param
    end

    assert_redirected_to vmodels_path
  end
end
