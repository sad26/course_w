require 'test_helper'

class AutomobilesControllerTest < ActionController::TestCase
  setup do
    @automobile = automobiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:automobiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create automobile" do
    assert_difference('Automobile.count') do
      post :create, automobile: { automobile_model: @automobile.automobile_model, automobile_type: @automobile.automobile_type, color: @automobile.color, release: @automobile.release, state_number: @automobile.state_number }
    end

    assert_redirected_to automobile_path(assigns(:automobile))
  end

  test "should show automobile" do
    get :show, id: @automobile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @automobile
    assert_response :success
  end

  test "should update automobile" do
    patch :update, id: @automobile, automobile: { automobile_model: @automobile.automobile_model, automobile_type: @automobile.automobile_type, color: @automobile.color, release: @automobile.release, state_number: @automobile.state_number }
    assert_redirected_to automobile_path(assigns(:automobile))
  end

  test "should destroy automobile" do
    assert_difference('Automobile.count', -1) do
      delete :destroy, id: @automobile
    end

    assert_redirected_to automobiles_path
  end
end
