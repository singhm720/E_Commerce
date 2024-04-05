require "test_helper"

class BuyNowControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buy_now_index_url
    assert_response :success
  end
end
