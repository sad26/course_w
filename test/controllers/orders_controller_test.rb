require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { arrival_address: @order.arrival_address, automobile_id: @order.automobile_id, departure_address: @order.departure_address, length_of_route: @order.length_of_route, number_of_passengers: @order.number_of_passengers, tariff_id: @order.tariff_id, time_of_travel: @order.time_of_travel }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { arrival_address: @order.arrival_address, automobile_id: @order.automobile_id, departure_address: @order.departure_address, length_of_route: @order.length_of_route, number_of_passengers: @order.number_of_passengers, tariff_id: @order.tariff_id, time_of_travel: @order.time_of_travel }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
