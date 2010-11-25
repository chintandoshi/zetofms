require 'test_helper'

class DetentionReasonsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detention_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detention_reason" do
    assert_difference('DetentionReason.count') do
      post :create, :detention_reason => { }
    end

    assert_redirected_to detention_reason_path(assigns(:detention_reason))
  end

  test "should show detention_reason" do
    get :show, :id => detention_reasons(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => detention_reasons(:one).to_param
    assert_response :success
  end

  test "should update detention_reason" do
    put :update, :id => detention_reasons(:one).to_param, :detention_reason => { }
    assert_redirected_to detention_reason_path(assigns(:detention_reason))
  end

  test "should destroy detention_reason" do
    assert_difference('DetentionReason.count', -1) do
      delete :destroy, :id => detention_reasons(:one).to_param
    end

    assert_redirected_to detention_reasons_path
  end
end
