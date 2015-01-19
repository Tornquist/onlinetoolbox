require 'test_helper'

class RecruitStatusesControllerTest < ActionController::TestCase
  setup do
    @recruit_status = recruit_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recruit_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recruit_status" do
    assert_difference('RecruitStatus.count') do
      post :create, recruit_status: { hidden: @recruit_status.hidden, name: @recruit_status.name }
    end

    assert_redirected_to recruit_status_path(assigns(:recruit_status))
  end

  test "should show recruit_status" do
    get :show, id: @recruit_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recruit_status
    assert_response :success
  end

  test "should update recruit_status" do
    patch :update, id: @recruit_status, recruit_status: { hidden: @recruit_status.hidden, name: @recruit_status.name }
    assert_redirected_to recruit_status_path(assigns(:recruit_status))
  end

  test "should destroy recruit_status" do
    assert_difference('RecruitStatus.count', -1) do
      delete :destroy, id: @recruit_status
    end

    assert_redirected_to recruit_statuses_path
  end
end
