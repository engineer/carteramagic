class Api::V1::UserController < ActionController::Base
  respond_to :json

  include Devise::Controllers::Helpers

  def signin
    begin
      user = User.find_by_email(user_params[:email])
      if user.valid_password?(user_params[:password])
        render :json => {"status" => "200", "content" => {"token" => user.token}}
      else
        render :json => {"status" => "401"}
      end
    rescue => e
      p e
      render :json => {"status" => "500", "content" => {"error" => e.message}}
    end
  end

  def signup
    begin
      user = User.new(user_params)
      user.save!
      render :json => {"status" => "200", "content" => {"token" => user.token}}
    rescue => e
      p e
      render :json => {"status" => "500", "content" => {"error" => e.message}}
    end
  end

  def user_params
    allow = [:first_name,:last_name,:email, :password, :password_confirmation]
    params.require(:user).permit(allow)
  end
end
