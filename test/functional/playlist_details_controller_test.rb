require 'test_helper'

class PlaylistDetailsControllerTest < ActionController::TestCase
  setup do
    @playlist_detail = playlist_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playlist_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playlist_detail" do
    assert_difference('PlaylistDetail.count') do
      post :create, playlist_detail: { playlist_id: @playlist_detail.playlist_id, track_data_id: @playlist_detail.track_data_id, track_no: @playlist_detail.track_no }
    end

    assert_redirected_to playlist_detail_path(assigns(:playlist_detail))
  end

  test "should show playlist_detail" do
    get :show, id: @playlist_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playlist_detail
    assert_response :success
  end

  test "should update playlist_detail" do
    put :update, id: @playlist_detail, playlist_detail: { playlist_id: @playlist_detail.playlist_id, track_data_id: @playlist_detail.track_data_id, track_no: @playlist_detail.track_no }
    assert_redirected_to playlist_detail_path(assigns(:playlist_detail))
  end

  test "should destroy playlist_detail" do
    assert_difference('PlaylistDetail.count', -1) do
      delete :destroy, id: @playlist_detail
    end

    assert_redirected_to playlist_details_path
  end
end
