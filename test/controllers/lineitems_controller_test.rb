require "test_helper"

class LineitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lineitems_index_url
    assert_response :success
  end

  test "should get new" do
    get lineitems_new_url
    assert_response :success
  end

  test "should get show" do
    get lineitems_show_url
    assert_response :success
  end

  test "should get edit" do
    get lineitems_edit_url
    assert_response :success
  end
end
