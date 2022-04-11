require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Shopone"
    @user = users(:damian)
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end
  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
  test "should get search" do
    get search_path
    assert_response :success
    assert_select "title", "Search | #{@base_title}"
  end
  test "should get offers" do
    get items_path
    assert_response :success
    assert_select "title", "Offers | #{@base_title}"
  end
  test "should get friends" do
    log_in_as(@user)
    get friends_path
    assert_response :success
    assert_select "title", "Friends | #{@base_title}"
  end
end