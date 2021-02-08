require "test_helper"

class GossipsControllerTest < ActionDispatch::IntegrationTest
  test "should get id" do
    get gossips_id_url
    assert_response :success
  end
end
