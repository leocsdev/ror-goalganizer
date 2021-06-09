require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test 'Should not save Tasks without name' do
  #   task = Task.new
  #   task.description = 'Model Task TDD Test'
  #   task.deadline = '2021-06-02'
  #   task.status = 'Started'

  #   assert_not task.save, "Saved Tasks without name"
  # end

  test "invalid without title" do # add presence: true
    tasks(:one).name = nil
    refute tasks(:one).valid?
  
    assert_not_nil tasks(:one).errors[:title]
  end
end
