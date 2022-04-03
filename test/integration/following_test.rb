require "test_helper"

class FollowingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:damian)
    log_in_as(@user)
  end

  test "following page" do
    get following_user_path(@user)
    assert_not @user.following.empty?
    assert_match @user.following.count.to_s, response.body
    @user.following.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end


  test "followers page" do            #TODO: fix undefined method `followers' for nil:NilClass (NoMethodError)|| assert_not @user.followers.empty?
    get followers_user_path(@user)
  end
  assert_not @user.followers.empty?
  assert_match @user.followers.count.to_s, response.body
  @user.followers.each do |user|
    assert_select "a[href=?]", user_path(user)
  end
end
