require 'test_helper'

class SectionNotesControllerTest < ActionController::TestCase
  setup do
    @section_note = section_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:section_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section_note" do
    assert_difference('SectionNote.count') do
      post :create, section_note: { content: @section_note.content, section_id: @section_note.section_id }
    end

    assert_redirected_to section_note_path(assigns(:section_note))
  end

  test "should show section_note" do
    get :show, id: @section_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section_note
    assert_response :success
  end

  test "should update section_note" do
    patch :update, id: @section_note, section_note: { content: @section_note.content, section_id: @section_note.section_id }
    assert_redirected_to section_note_path(assigns(:section_note))
  end

  test "should destroy section_note" do
    assert_difference('SectionNote.count', -1) do
      delete :destroy, id: @section_note
    end

    assert_redirected_to section_notes_path
  end
end
