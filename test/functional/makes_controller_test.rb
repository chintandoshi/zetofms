require 'test_helper'

class MakesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:makes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create make" do
    assert_difference('Make.count') do
      post :create, :make => { }
    end

    assert_redirected_to make_path(assigns(:make))
  end

  test "should show make" do
    get :show, :id => makes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => makes(:one).to_param
    assert_response :success
  end

  test "should update make" do
    put :update, :id => makes(:one).to_param, :make => { }
    assert_redirected_to make_path(assigns(:make))
  end

  test "should destroy make" do
    assert_difference('Make.count', -1) do
      delete :destroy, :id => makes(:one).to_param
    end

    assert_redirected_to makes_path
  end
end
