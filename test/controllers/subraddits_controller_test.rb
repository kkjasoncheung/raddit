require 'test_helper'

class SubradditsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subraddits_index_url
    assert_response :success
  end

  test "should get show" do
    get subraddits_show_url
    assert_response :success
  end

  test "should get edit" do
    get subraddits_edit_url
    assert_response :success
  end

  test "should get new" do
    get subraddits_new_url
    assert_response :success
  end

  test "should get delete" do
    get subraddits_delete_url
    assert_response :success
  end

end
