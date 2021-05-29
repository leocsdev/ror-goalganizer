require "test_helper"

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'Should not save Goals without title' do
    goal = Goal.new
    goal.description = 'Model TDD Test'

    assert_not goal.save, "Saved Goals without title"
  end
end
