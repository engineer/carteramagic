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

  # Definimos los parametros
  private
  def goal_params
    params.require(:goal).permit(:amount, :start_at, :end_at, :concept, :user_id)
  end

  # def index
  #   if params[:goal] && params[:goal][:category]
  #     render json: Goal.where(category: params[:goal][:category])
  #   else
  #     render json: Goal.all
  #   end
  # end
  #

  # def update
  #   goal = Goal.find(params[:id])
  #
  #   if goal.update(goal_params)
  #     render json: goal, status: 200
  #   else
  #     render json: { errors: goal.errors }, status: 422
  #   end
  # end
  #
  # def destroy
  #   goal = Goal.find(params[:id])
  #   goal.destroy
  #   head 204
  # end
end
