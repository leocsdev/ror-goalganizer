class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    # @goals = Goal.all
    if current_user
      @tasks = current_user.tasks
    end
  end

  def about
  end
end
