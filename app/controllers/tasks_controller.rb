class TasksController < ApplicationController
  # Do this first before any other methods below
  before_action :get_goal

  def index
    @tasks = @goal.tasks
  end

  def new
    @task = @goal.tasks.build
  end

  def create
    @task = @goal.tasks.build(task_params)

    if @task.save
      redirect_to goal_tasks_path
    else
      render :new
    end
  end

  private

  def get_goal
    @goal = Goal.find(params[:goal_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :status, :goal_id)
  end
end
