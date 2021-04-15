require "test_helper"

class ProductOrderInstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_order_instance = product_order_instances(:one)
  end

  test "should get index" do
    get product_order_instances_url, as: :json
    assert_response :success
  end

  test "should create product_order_instance" do
    assert_difference('ProductOrderInstance.count') do
      post product_order_instances_url, params: { product_order_instance: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show product_order_instance" do
    get product_order_instance_url(@product_order_instance), as: :json
    assert_response :success
  end

  test "should update product_order_instance" do
    patch product_order_instance_url(@product_order_instance), params: { product_order_instance: {  } }, as: :json
    assert_response 200
  end

  test "should destroy product_order_instance" do
    assert_difference('ProductOrderInstance.count', -1) do
      delete product_order_instance_url(@product_order_instance), as: :json
    end

    assert_response 204
  end
end
