require "test_helper"

class GoalsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'Should go to index' do
    get goals_path
    assert_response :success
  end

  test 'Should get to new' do
    get new_goal_path 
    assert_response :success
  end

  test 'Should get to create' do
    post goals_path,
    params: {
      goal: {
        title: 'Goals Controller TDD',
        description: 'Goals description Controller TDD'
      }
    }
    assert_response :redirect
  end
end
