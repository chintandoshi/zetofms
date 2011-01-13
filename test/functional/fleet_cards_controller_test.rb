require 'test_helper'

class FleetCardsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fleet_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fleet_card" do
    assert_difference('FleetCard.count') do
      post :create, :fleet_card => { }
    end

    assert_redirected_to fleet_card_path(assigns(:fleet_card))
  end

  test "should show fleet_card" do
    get :show, :id => fleet_cards(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fleet_cards(:one).to_param
    assert_response :success
  end

  test "should update fleet_card" do
    put :update, :id => fleet_cards(:one).to_param, :fleet_card => { }
    assert_redirected_to fleet_card_path(assigns(:fleet_card))
  end

  test "should destroy fleet_card" do
    assert_difference('FleetCard.count', -1) do
      delete :destroy, :id => fleet_cards(:one).to_param
    end

    assert_redirected_to fleet_cards_path
  end
end
