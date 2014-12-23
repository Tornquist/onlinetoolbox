require 'test_helper'

class StudentInstrumentsControllerTest < ActionController::TestCase
  setup do
    @student_instrument = student_instruments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_instruments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_instrument" do
    assert_difference('StudentInstrument.count') do
      post :create, student_instrument: { ensemble_id: @student_instrument.ensemble_id, instrument_id: @student_instrument.instrument_id, student_id: @student_instrument.student_id }
    end

    assert_redirected_to student_instrument_path(assigns(:student_instrument))
  end

  test "should show student_instrument" do
    get :show, id: @student_instrument
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_instrument
    assert_response :success
  end

  test "should update student_instrument" do
    patch :update, id: @student_instrument, student_instrument: { ensemble_id: @student_instrument.ensemble_id, instrument_id: @student_instrument.instrument_id, student_id: @student_instrument.student_id }
    assert_redirected_to student_instrument_path(assigns(:student_instrument))
  end

  test "should destroy student_instrument" do
    assert_difference('StudentInstrument.count', -1) do
      delete :destroy, id: @student_instrument
    end

    assert_redirected_to student_instruments_path
  end
end
