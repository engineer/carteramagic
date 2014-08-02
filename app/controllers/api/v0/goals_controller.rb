class Api::V0::GoalsController < ApplicationController
  respond_to :json

  def create
    goal = Goal.new(goal_params)
    if goal.save!
      render :json => {"status" => "201", "content" => {"id" => goal.id}}
    else
      render :json => {"status" => "422", "content" => {"error" => goal.errors}}
    end
  end

  def show
    if Goal.find(params[:id])
      render :json => {"status" => "302", "content" => {"goal" => Goal.find(params[:id])}}
    else
      render :json => {"status" => "404", "content" => {"error" => @goal.errors}}
    end
  end

  #  def index
  #   if params[:goal] && params[:goal][:category]
  #     render json: Goal.where(category: params[:goal][:category])
  #   else
  #     render json: Goal.all
  #   end
  # end

  private
  def goal_params
    params.require(:goal).permit(:amount, :start_at, :end_at, :concept, :daily_goal, :total_saved, :user_id)
  end

end
