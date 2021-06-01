require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    # get home_index_url
    get goals_path
    assert_response :success
  end

  test "should get about" do
    # get home_about_url
    get about_path
    assert_response :success
  end
end
