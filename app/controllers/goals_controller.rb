class GoalsController < ApplicationController
  before_action :authenticate_user!
  # before_action :get_user

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

    @tasksLength = @goal.tasks.count
    @tasksStarted = @goal.tasks.where(status: 'Started').order(deadline: :asc)

    @tasksCompleted = @goal.tasks.where(status: 'Completed').order(deadline: :desc)
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

  private

  # def get_user
    # @user = User.find(params[:user_id])
    # @user = User.find(params[:id])
  # end

  def goal_params
    params.require(:goal).permit(:title, :description, :user_id)
  end
end
