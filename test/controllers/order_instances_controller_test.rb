require "test_helper"

class OrderInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_instance = order_instances(:one)
  end

  test "should get index" do
    get order_instances_url, as: :json
    assert_response :success
  end

  test "should create order_instance" do
    assert_difference('OrderInstance.count') do
      post order_instances_url, params: { order_instance: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show order_instance" do
    get order_instance_url(@order_instance), as: :json
    assert_response :success
  end

  test "should update order_instance" do
    patch order_instance_url(@order_instance), params: { order_instance: {  } }, as: :json
    assert_response 200
  end

  test "should destroy order_instance" do
    assert_difference('OrderInstance.count', -1) do
      delete order_instance_url(@order_instance), as: :json
    end

    assert_response 204
  end
end
