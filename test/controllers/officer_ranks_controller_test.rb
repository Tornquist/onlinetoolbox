require 'test_helper'

class OfficerRanksControllerTest < ActionController::TestCase
  setup do
    @officer_rank = officer_ranks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:officer_ranks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create officer_rank" do
    assert_difference('OfficerRank.count') do
      post :create, officer_rank: { hours: @officer_rank.hours, inventory: @officer_rank.inventory, name: @officer_rank.name }
    end

    assert_redirected_to officer_rank_path(assigns(:officer_rank))
  end

  test "should show officer_rank" do
    get :show, id: @officer_rank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @officer_rank
    assert_response :success
  end

  test "should update officer_rank" do
    patch :update, id: @officer_rank, officer_rank: { hours: @officer_rank.hours, inventory: @officer_rank.inventory, name: @officer_rank.name }
    assert_redirected_to officer_rank_path(assigns(:officer_rank))
  end

  test "should destroy officer_rank" do
    assert_difference('OfficerRank.count', -1) do
      delete :destroy, id: @officer_rank
    end

    assert_redirected_to officer_ranks_path
  end
end
