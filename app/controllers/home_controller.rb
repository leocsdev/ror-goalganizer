class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    # If user is logged in
    if current_user
      # get all tasks due today
      @tasks = current_user.tasks.where(
        deadline: Date.current, 
        status: 'Started'
      )
    end
  end

  def about
  end
end
