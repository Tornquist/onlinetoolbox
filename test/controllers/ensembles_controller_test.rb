require 'test_helper'

class EnsemblesControllerTest < ActionController::TestCase
  setup do
    @ensemble = ensembles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ensembles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ensemble" do
    assert_difference('Ensemble.count') do
      post :create, ensemble: { name: @ensemble.name }
    end

    assert_redirected_to ensemble_path(assigns(:ensemble))
  end

  test "should show ensemble" do
    get :show, id: @ensemble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ensemble
    assert_response :success
  end

  test "should update ensemble" do
    patch :update, id: @ensemble, ensemble: { name: @ensemble.name }
    assert_redirected_to ensemble_path(assigns(:ensemble))
  end

  test "should destroy ensemble" do
    assert_difference('Ensemble.count', -1) do
      delete :destroy, id: @ensemble
    end

    assert_redirected_to ensembles_path
  end
end
