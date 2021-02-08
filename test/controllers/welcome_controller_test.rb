require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get welcome_users_url
    assert_response :success
  end
end
