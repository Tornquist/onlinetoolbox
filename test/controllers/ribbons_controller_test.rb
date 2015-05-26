require 'test_helper'

class RibbonsControllerTest < ActionController::TestCase
  setup do
    @ribbon = ribbons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ribbons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ribbon" do
    assert_difference('Ribbon.count') do
      post :create, ribbon: { description: @ribbon.description, hidden: @ribbon.hidden, index: @ribbon.index, name: @ribbon.name }
    end

    assert_redirected_to ribbon_path(assigns(:ribbon))
  end

  test "should show ribbon" do
    get :show, id: @ribbon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ribbon
    assert_response :success
  end

  test "should update ribbon" do
    patch :update, id: @ribbon, ribbon: { description: @ribbon.description, hidden: @ribbon.hidden, index: @ribbon.index, name: @ribbon.name }
    assert_redirected_to ribbon_path(assigns(:ribbon))
  end

  test "should destroy ribbon" do
    assert_difference('Ribbon.count', -1) do
      delete :destroy, id: @ribbon
    end

    assert_redirected_to ribbons_path
  end
end
