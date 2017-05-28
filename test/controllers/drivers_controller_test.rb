require 'test_helper'

class DriversControllerTest < ActionController::TestCase
  setup do
    @driver = drivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driver" do
    assert_difference('Driver.count') do
      post :create, driver: { automobile_id: @driver.automobile_id, date_of_birth: @driver.date_of_birth, first_name: @driver.first_name, itn: @driver.itn, last_name: @driver.last_name, passport: @driver.passport, patronymic: @driver.patronymic }
    end

    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should show driver" do
    get :show, id: @driver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driver
    assert_response :success
  end

  test "should update driver" do
    patch :update, id: @driver, driver: { automobile_id: @driver.automobile_id, date_of_birth: @driver.date_of_birth, first_name: @driver.first_name, itn: @driver.itn, last_name: @driver.last_name, passport: @driver.passport, patronymic: @driver.patronymic }
    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should destroy driver" do
    assert_difference('Driver.count', -1) do
      delete :destroy, id: @driver
    end

    assert_redirected_to drivers_path
  end
end
