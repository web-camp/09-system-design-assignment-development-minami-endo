require 'test_helper'

class Admins::OrderProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_order_products_update_url
    assert_response :success
  end

end
