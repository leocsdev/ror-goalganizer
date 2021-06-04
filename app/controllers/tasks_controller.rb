class TasksController < ApplicationController
  # Do this first before any other methods below
  before_action :get_goal

  def index
    redirect_to goal_path(params[:goal_id])
  end

  def new
    @task = @goal.tasks.build
  end

  def create
    @task = @goal.tasks.build(task_params)

    if @task.save
      redirect_to goal_path(params[:goal_id])
    else
      render :new
    end
  end

  def show
    redirect_to goal_path(params[:goal_id])
  end

  def edit
    @task = @goal.tasks.find(params[:id])
  end

  def update
    @task = @goal.tasks.find(params[:id])

    if @task.update(task_params)
      redirect_to goal_path(params[:goal_id])
    else
      render :edit
    end
  end

  def destroy
    
  end


  private

  def get_goal
    @goal = Goal.find(params[:goal_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :status, :goal_id)
  end
end
