require 'test_helper'

class GdsControllerTest < ActionController::TestCase
  setup do
    @gds = gds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gds" do
    assert_difference('Gds.count') do
      post :create, gds: { available: @gds.available, comment: @gds.comment, game_id: @gds.game_id, gds_type_id: @gds.gds_type_id, student_id: @gds.student_id, user_id: @gds.user_id }
    end

    assert_redirected_to gds_path(assigns(:gds))
  end

  test "should show gds" do
    get :show, id: @gds
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gds
    assert_response :success
  end

  test "should update gds" do
    patch :update, id: @gds, gds: { available: @gds.available, comment: @gds.comment, game_id: @gds.game_id, gds_type_id: @gds.gds_type_id, student_id: @gds.student_id, user_id: @gds.user_id }
    assert_redirected_to gds_path(assigns(:gds))
  end

  test "should destroy gds" do
    assert_difference('Gds.count', -1) do
      delete :destroy, id: @gds
    end

    assert_redirected_to gds_index_path
  end
end
