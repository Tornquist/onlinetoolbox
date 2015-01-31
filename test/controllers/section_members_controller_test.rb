require 'test_helper'

class SectionMembersControllerTest < ActionController::TestCase
  setup do
    @section_member = section_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:section_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section_member" do
    assert_difference('SectionMember.count') do
      post :create, section_member: { section_id: @section_member.section_id, student_id: @section_member.student_id }
    end

    assert_redirected_to section_member_path(assigns(:section_member))
  end

  test "should show section_member" do
    get :show, id: @section_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section_member
    assert_response :success
  end

  test "should update section_member" do
    patch :update, id: @section_member, section_member: { section_id: @section_member.section_id, student_id: @section_member.student_id }
    assert_redirected_to section_member_path(assigns(:section_member))
  end

  test "should destroy section_member" do
    assert_difference('SectionMember.count', -1) do
      delete :destroy, id: @section_member
    end

    assert_redirected_to section_members_path
  end
end
