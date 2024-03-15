require "test_helper"

class UploadProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upload_product_index_url
    assert_response :success
  end

  test "should get save" do
    get upload_product_save_url
    assert_response :success
  end

  test "should get update" do
    get upload_product_update_url
    assert_response :success
  end

  test "should get edit" do
    get upload_product_edit_url
    assert_response :success
  end

  test "should get delete" do
    get upload_product_delete_url
    assert_response :success
  end
end
