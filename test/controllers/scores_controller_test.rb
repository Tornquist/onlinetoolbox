require 'test_helper'

class ScoresControllerTest < ActionController::TestCase
  setup do
    @score = scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score" do
    assert_difference('Score.count') do
      post :create, score: { comment: @score.comment, game_id: @score.game_id, gameday_enthusiasm: @score.gameday_enthusiasm, gameday_professionalism: @score.gameday_professionalism, marching_effort: @score.marching_effort, marching_fundamentals: @score.marching_fundamentals, marching_precision: @score.marching_precision, memorization: @score.memorization, music_effort: @score.music_effort, preparedness: @score.preparedness, punctuality: @score.punctuality, rehearsal_etiquette: @score.rehearsal_etiquette, student_id: @score.student_id, user_id: @score.user_id }
    end

    assert_redirected_to score_path(assigns(:score))
  end

  test "should show score" do
    get :show, id: @score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @score
    assert_response :success
  end

  test "should update score" do
    patch :update, id: @score, score: { comment: @score.comment, game_id: @score.game_id, gameday_enthusiasm: @score.gameday_enthusiasm, gameday_professionalism: @score.gameday_professionalism, marching_effort: @score.marching_effort, marching_fundamentals: @score.marching_fundamentals, marching_precision: @score.marching_precision, memorization: @score.memorization, music_effort: @score.music_effort, preparedness: @score.preparedness, punctuality: @score.punctuality, rehearsal_etiquette: @score.rehearsal_etiquette, student_id: @score.student_id, user_id: @score.user_id }
    assert_redirected_to score_path(assigns(:score))
  end

  test "should destroy score" do
    assert_difference('Score.count', -1) do
      delete :destroy, id: @score
    end

    assert_redirected_to scores_path
  end
end
