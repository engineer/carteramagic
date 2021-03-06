class Api::V0::UsersController < ApplicationController
  respond_to :json

  include Devise::Controllers::Helpers


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

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user, status: 200
    else
      render json: { errors: user.errors }, status: 422
    end
  end


  def sign_in
    begin
      user = User.find_by_email(user_params[:email])
      if user.valid_password?(user_params[:password])
        render :json => {"status" => "200", "content" => {"user_id" => user.id}}
      else
        render :json => {"status" => "401", "content" => {"error" => "access denied"} }
      end
    rescue => e
      render :json => {"status" => "500", "content" => {"error" => e.message}}
    end
  end

  def sign_up
    begin
      user = User.new(user_params)
      if user.save!
        render :json => {"status" => "200", "content" => {"user_id" => user.id}}
      else
        render :json => {"status" => "401", "content" => {"error" => e.message}}
      end
    rescue => e
      render :json => {"status" => "500", "content" => {"error" => e.message}}
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:email, :password, :password_confirmation)
  end

end
