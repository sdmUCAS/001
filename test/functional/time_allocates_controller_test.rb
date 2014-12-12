require 'test_helper'

class TimeAllocatesControllerTest < ActionController::TestCase
  setup do
    @time_allocate = time_allocates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_allocates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_allocate" do
    assert_difference('TimeAllocate.count') do
      post :create, time_allocate: @time_allocate.attributes
    end

    assert_redirected_to time_allocate_path(assigns(:time_allocate))
  end

  test "should show time_allocate" do
    get :show, id: @time_allocate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_allocate
    assert_response :success
  end

  test "should update time_allocate" do
    put :update, id: @time_allocate, time_allocate: @time_allocate.attributes
    assert_redirected_to time_allocate_path(assigns(:time_allocate))
  end

  test "should destroy time_allocate" do
    assert_difference('TimeAllocate.count', -1) do
      delete :destroy, id: @time_allocate
    end

    assert_redirected_to time_allocates_path
  end
end
