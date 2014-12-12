require 'test_helper'

class EqMaintainsControllerTest < ActionController::TestCase
  setup do
    @eq_maintain = eq_maintains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eq_maintains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eq_maintain" do
    assert_difference('EqMaintain.count') do
      post :create, eq_maintain: @eq_maintain.attributes
    end

    assert_redirected_to eq_maintain_path(assigns(:eq_maintain))
  end

  test "should show eq_maintain" do
    get :show, id: @eq_maintain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eq_maintain
    assert_response :success
  end

  test "should update eq_maintain" do
    put :update, id: @eq_maintain, eq_maintain: @eq_maintain.attributes
    assert_redirected_to eq_maintain_path(assigns(:eq_maintain))
  end

  test "should destroy eq_maintain" do
    assert_difference('EqMaintain.count', -1) do
      delete :destroy, id: @eq_maintain
    end

    assert_redirected_to eq_maintains_path
  end
end
