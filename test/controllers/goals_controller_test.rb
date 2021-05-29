require "test_helper"

class GoalsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'Should go to index' do
    get goals_path
    assert_response :success
  end
end
