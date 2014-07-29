class Api::V0::UsersController < ApplicationController
  respond_to :json

  def index
      render json: User.all
  end

  def show
    if params[:email]
      if User.find_by_email(params[:email])
        render json: nil, status: 302
      else
        render json: nil, status: 404
      end
    else
      respond_with User.find(params[:id])
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user, status: 200
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email, :password, :password_confirmation)
  end

end
