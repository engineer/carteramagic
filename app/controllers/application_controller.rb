class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  # custom 404
  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound,
                ActionController::RoutingError,
                ActionController::UnknownController,
                ActionController::UnknownAction,
                ActionController::MethodNotAllowed do |exception|

      # Put loggers here, if desired.
      redirect_to four_oh_four_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
  end

  private

    def after_sign_in_path_for(resource)
      dashboard_path
    end

    def after_update_path_for(resource)
      dashboard_path
    end

end
