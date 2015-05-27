require 'test_helper'

class StudentOfficerRanksControllerTest < ActionController::TestCase
  setup do
    @student_officer_rank = student_officer_ranks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_officer_ranks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_officer_rank" do
    assert_difference('StudentOfficerRank.count') do
      post :create, student_officer_rank: { date_approved: @student_officer_rank.date_approved, date_issued: @student_officer_rank.date_issued, date_returned: @student_officer_rank.date_returned, rank_id: @student_officer_rank.rank_id, student_id: @student_officer_rank.student_id }
    end

    assert_redirected_to student_officer_rank_path(assigns(:student_officer_rank))
  end

  test "should show student_officer_rank" do
    get :show, id: @student_officer_rank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_officer_rank
    assert_response :success
  end

  test "should update student_officer_rank" do
    patch :update, id: @student_officer_rank, student_officer_rank: { date_approved: @student_officer_rank.date_approved, date_issued: @student_officer_rank.date_issued, date_returned: @student_officer_rank.date_returned, rank_id: @student_officer_rank.rank_id, student_id: @student_officer_rank.student_id }
    assert_redirected_to student_officer_rank_path(assigns(:student_officer_rank))
  end

  test "should destroy student_officer_rank" do
    assert_difference('StudentOfficerRank.count', -1) do
      delete :destroy, id: @student_officer_rank
    end

    assert_redirected_to student_officer_ranks_path
  end
end
