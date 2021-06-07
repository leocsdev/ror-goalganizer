class HomeController < ApplicationController
  def index
    # If user is logged in
    if current_user
      # Get all goals for current user
      @goals = current_user.goals

      # Get all tasks both due and overdue
      @tasks = current_user.tasks.where(
        "deadline <= ? AND status = ?", Date.today, 'Started'
      )

      # Get all tasks due today
      @tasks_due_today = current_user.tasks.where(
        "deadline = ? AND status = ?", Date.today, 'Started'
      )

      # Get all tasks overdue
      @tasks_overdue = current_user.tasks.where(
        "deadline < ? AND status = ?", Date.today, 'Started'
      )      
    end
  end

  def about
  end
end
