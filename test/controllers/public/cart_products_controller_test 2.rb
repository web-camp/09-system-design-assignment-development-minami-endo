require 'test_helper'

class Public::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cart_products_index_url
    assert_response :success
  end

  test "should get update" do
    get public_cart_products_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_cart_products_destroy_url
    assert_response :success
  end

  test "should get destroy_all" do
    get public_cart_products_destroy_all_url
    assert_response :success
  end

  test "should get create" do
    get public_cart_products_create_url
    assert_response :success
  end

end
