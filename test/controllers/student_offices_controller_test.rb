require 'test_helper'

class StudentOfficesControllerTest < ActionController::TestCase
  setup do
    @student_office = student_offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_office" do
    assert_difference('StudentOffice.count') do
      post :create, student_office: { office_id: @student_office.office_id, student_id: @student_office.student_id }
    end

    assert_redirected_to student_office_path(assigns(:student_office))
  end

  test "should show student_office" do
    get :show, id: @student_office
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_office
    assert_response :success
  end

  test "should update student_office" do
    patch :update, id: @student_office, student_office: { office_id: @student_office.office_id, student_id: @student_office.student_id }
    assert_redirected_to student_office_path(assigns(:student_office))
  end

  test "should destroy student_office" do
    assert_difference('StudentOffice.count', -1) do
      delete :destroy, id: @student_office
    end

    assert_redirected_to student_offices_path
  end
end
