require 'test_helper'

class ClaimedStudentsControllerTest < ActionController::TestCase
  setup do
    @claimed_student = claimed_students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:claimed_students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create claimed_student" do
    assert_difference('ClaimedStudent.count') do
      post :create, claimed_student: { student_id: @claimed_student.student_id, user_id: @claimed_student.user_id }
    end

    assert_redirected_to claimed_student_path(assigns(:claimed_student))
  end

  test "should show claimed_student" do
    get :show, id: @claimed_student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @claimed_student
    assert_response :success
  end

  test "should update claimed_student" do
    patch :update, id: @claimed_student, claimed_student: { student_id: @claimed_student.student_id, user_id: @claimed_student.user_id }
    assert_redirected_to claimed_student_path(assigns(:claimed_student))
  end

  test "should destroy claimed_student" do
    assert_difference('ClaimedStudent.count', -1) do
      delete :destroy, id: @claimed_student
    end

    assert_redirected_to claimed_students_path
  end
end
