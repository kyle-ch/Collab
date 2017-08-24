require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get spotify" do
    get user_spotify_url
    assert_response :success
  end

end
