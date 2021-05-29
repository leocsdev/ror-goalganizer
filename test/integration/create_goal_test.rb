require "test_helper"

class GoalsControllerTest < ActionDispatch::IntegrationTest
  test 'Should go to new goal form and create goal' do
    get goals_path
    assert_response :success

    assert_difference 'Goal.count', 1 do
      post goals_path,
      params: {
        goal: {
          title: 'Goals Integration TDD',
          description: 'Goals description Controller TDD'
        }
      }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end
