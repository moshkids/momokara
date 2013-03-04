require 'test_helper'

class TrackDataControllerTest < ActionController::TestCase
  setup do
    @track_datum = track_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:track_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create track_datum" do
    assert_difference('TrackDatum.count') do
      post :create, track_datum: { lyric: @track_datum.lyric, time: @track_datum.time, title: @track_datum.title }
    end

    assert_redirected_to track_datum_path(assigns(:track_datum))
  end

  test "should show track_datum" do
    get :show, id: @track_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @track_datum
    assert_response :success
  end

  test "should update track_datum" do
    put :update, id: @track_datum, track_datum: { lyric: @track_datum.lyric, time: @track_datum.time, title: @track_datum.title }
    assert_redirected_to track_datum_path(assigns(:track_datum))
  end

  test "should destroy track_datum" do
    assert_difference('TrackDatum.count', -1) do
      delete :destroy, id: @track_datum
    end

    assert_redirected_to track_data_path
  end
end
