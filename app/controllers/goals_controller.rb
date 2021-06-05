class GoalsController < ApplicationController
  def index
    @goals = Goal.all.order(created_at: :desc)
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)

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
  def goal_params
    params.require(:goal).permit(:title, :description, :user_id)
  end
end
