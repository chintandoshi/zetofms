require 'test_helper'

class CustcontactsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custcontacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custcontact" do
    assert_difference('Custcontact.count') do
      post :create, :custcontact => { }
    end

    assert_redirected_to custcontact_path(assigns(:custcontact))
  end

  test "should show custcontact" do
    get :show, :id => custcontacts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => custcontacts(:one).to_param
    assert_response :success
  end

  test "should update custcontact" do
    put :update, :id => custcontacts(:one).to_param, :custcontact => { }
    assert_redirected_to custcontact_path(assigns(:custcontact))
  end

  test "should destroy custcontact" do
    assert_difference('Custcontact.count', -1) do
      delete :destroy, :id => custcontacts(:one).to_param
    end

    assert_redirected_to custcontacts_path
  end
end
