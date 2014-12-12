require 'test_helper'

class YyInformationsControllerTest < ActionController::TestCase
  setup do
    @yy_information = yy_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yy_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yy_information" do
    assert_difference('YyInformation.count') do
      post :create, yy_information: @yy_information.attributes
    end

    assert_redirected_to yy_information_path(assigns(:yy_information))
  end

  test "should show yy_information" do
    get :show, id: @yy_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yy_information
    assert_response :success
  end

  test "should update yy_information" do
    put :update, id: @yy_information, yy_information: @yy_information.attributes
    assert_redirected_to yy_information_path(assigns(:yy_information))
  end

  test "should destroy yy_information" do
    assert_difference('YyInformation.count', -1) do
      delete :destroy, id: @yy_information
    end

    assert_redirected_to yy_informations_path
  end
end
