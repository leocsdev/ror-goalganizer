class TasksController < ApplicationController
  # Do this first before any other methods below
  before_action :authenticate_user!
  before_action :get_goal
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    # @tasks = @goal.tasks.order(name: :desc)
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
    @task = @goal.tasks.find(params[:id])
    @task.destroy

    redirect_to goal_path(params[:goal_id])
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    redirect_to goals_path, notice: "That is someone's task, you are NOT AUTORIZED to edit that task" if @task.nil?
  end


  private

  def get_goal
    @goal = Goal.find(params[:goal_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :deadline, :status, :goal_id)
  end
end
