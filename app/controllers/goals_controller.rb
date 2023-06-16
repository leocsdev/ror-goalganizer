class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    # @goals = Goal.all.order(created_at: :desc)
    @goals = current_user.goals
  end

  def new
    # @goal = Goal.new
    @goal = current_user.goals.build
  end

  def create
    # @goal = Goal.new(goal_params)
    @goal = current_user.goals.build(goal_params)

    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])

    @tasks_length = @goal.tasks.count
    @tasks_started = @goal.tasks.where(status: 'Started').order(deadline: :asc)
    @tasks_completed = @goal.tasks.where(status: 'Completed').order(deadline: :desc)
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update(goal_params)
      redirect_to goal_path
    else
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to goals_path
  end

  def correct_user
    @goal = current_user.goals.find_by(id: params[:id])
    redirect_to goals_path, notice: "That is someone's goal, you are NOT AUTORIZED to edit that goal" if @goal.nil?
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :user_id)
  end
end
