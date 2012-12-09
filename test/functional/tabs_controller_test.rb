require 'test_helper'

class TabsControllerTest < ActionController::TestCase
  setup do
    @tab = tabs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tab" do
    assert_difference('Tab.count') do
      post :create, tab: { artist: @tab.artist, author: @tab.author, song: @tab.song, tuning: @tab.tuning }
    end

    assert_redirected_to tab_path(assigns(:tab))
  end

  test "should show tab" do
    get :show, id: @tab
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tab
    assert_response :success
  end

  test "should update tab" do
    put :update, id: @tab, tab: { artist: @tab.artist, author: @tab.author, song: @tab.song, tuning: @tab.tuning }
    assert_redirected_to tab_path(assigns(:tab))
  end

  test "should destroy tab" do
    assert_difference('Tab.count', -1) do
      delete :destroy, id: @tab
    end

    assert_redirected_to tabs_path
  end
end
