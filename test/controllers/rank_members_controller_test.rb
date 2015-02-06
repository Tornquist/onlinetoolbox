require 'test_helper'

class RankMembersControllerTest < ActionController::TestCase
  setup do
    @rank_member = rank_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rank_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rank_member" do
    assert_difference('RankMember.count') do
      post :create, rank_member: { rank_id: @rank_member.rank_id, student_id: @rank_member.student_id }
    end

    assert_redirected_to rank_member_path(assigns(:rank_member))
  end

  test "should show rank_member" do
    get :show, id: @rank_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rank_member
    assert_response :success
  end

  test "should update rank_member" do
    patch :update, id: @rank_member, rank_member: { rank_id: @rank_member.rank_id, student_id: @rank_member.student_id }
    assert_redirected_to rank_member_path(assigns(:rank_member))
  end

  test "should destroy rank_member" do
    assert_difference('RankMember.count', -1) do
      delete :destroy, id: @rank_member
    end

    assert_redirected_to rank_members_path
  end
end
