require 'test_helper'

class FavoriteInstrumentsControllerTest < ActionController::TestCase
  setup do
    @favorite_instrument = favorite_instruments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_instruments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_instrument" do
    assert_difference('FavoriteInstrument.count') do
      post :create, favorite_instrument: { instrument_id: @favorite_instrument.instrument_id, user_id: @favorite_instrument.user_id }
    end

    assert_redirected_to favorite_instrument_path(assigns(:favorite_instrument))
  end

  test "should show favorite_instrument" do
    get :show, id: @favorite_instrument
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_instrument
    assert_response :success
  end

  test "should update favorite_instrument" do
    patch :update, id: @favorite_instrument, favorite_instrument: { instrument_id: @favorite_instrument.instrument_id, user_id: @favorite_instrument.user_id }
    assert_redirected_to favorite_instrument_path(assigns(:favorite_instrument))
  end

  test "should destroy favorite_instrument" do
    assert_difference('FavoriteInstrument.count', -1) do
      delete :destroy, id: @favorite_instrument
    end

    assert_redirected_to favorite_instruments_path
  end
end
