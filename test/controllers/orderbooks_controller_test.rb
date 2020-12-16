require 'test_helper'

class OrderbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orderbooks_index_url
    assert_response :success
  end

  test "should get show" do
    get orderbooks_show_url
    assert_response :success
  end

  test "should get new" do
    get orderbooks_new_url
    assert_response :success
  end

  test "should get edit" do
    get orderbooks_edit_url
    assert_response :success
  end

end
