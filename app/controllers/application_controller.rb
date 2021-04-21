class ApplicationController < ActionController::API

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource, status: 200
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(
        :email,
        :password,
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:email, :password, :password_confirmation, :current_password)
    end
  end
end
