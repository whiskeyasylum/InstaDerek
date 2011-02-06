require 'test_helper'

class DerekslistsControllerTest < ActionController::TestCase
  setup do
    @derekslist = derekslists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:derekslists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create derekslist" do
    assert_difference('Derekslist.count') do
      post :create, :derekslist => @derekslist.attributes
    end

    assert_redirected_to derekslist_path(assigns(:derekslist))
  end

  test "should show derekslist" do
    get :show, :id => @derekslist.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @derekslist.to_param
    assert_response :success
  end

  test "should update derekslist" do
    put :update, :id => @derekslist.to_param, :derekslist => @derekslist.attributes
    assert_redirected_to derekslist_path(assigns(:derekslist))
  end

  test "should destroy derekslist" do
    assert_difference('Derekslist.count', -1) do
      delete :destroy, :id => @derekslist.to_param
    end

    assert_redirected_to derekslists_path
  end
end
