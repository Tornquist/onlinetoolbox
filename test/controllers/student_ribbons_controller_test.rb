require 'test_helper'

class StudentRibbonsControllerTest < ActionController::TestCase
  setup do
    @student_ribbon = student_ribbons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_ribbons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_ribbon" do
    assert_difference('StudentRibbon.count') do
      post :create, student_ribbon: { ribbon_id: @student_ribbon.ribbon_id, student_id: @student_ribbon.student_id }
    end

    assert_redirected_to student_ribbon_path(assigns(:student_ribbon))
  end

  test "should show student_ribbon" do
    get :show, id: @student_ribbon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_ribbon
    assert_response :success
  end

  test "should update student_ribbon" do
    patch :update, id: @student_ribbon, student_ribbon: { ribbon_id: @student_ribbon.ribbon_id, student_id: @student_ribbon.student_id }
    assert_redirected_to student_ribbon_path(assigns(:student_ribbon))
  end

  test "should destroy student_ribbon" do
    assert_difference('StudentRibbon.count', -1) do
      delete :destroy, id: @student_ribbon
    end

    assert_redirected_to student_ribbons_path
  end
end
