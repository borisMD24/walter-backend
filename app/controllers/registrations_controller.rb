class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  before_action :authenticate_user!, only: [:update]
 
  before_action :sign_up_params_verifications, only: [:create]
  I18n.locale = :fr

  def create
    build_resource(sign_up_params)
    resource.save
    sign_up(resource_name, resource) if resource.persisted?
    render json: resource, status: :created 
  end
  
  def update
    puts current_user
    puts params
    puts user_params
    if current_user.update(user_params)
      render json: current_user, status: :ok
    else
      normalized_errors = ["A6"]
      errors = I18n.t("errorA6")
      render json: {
        "error_codes" => normalized_errors,
        "translated" => errors
      }, status: :bad_request
    end
  end
  
  private

  def user_params
    params
      .require(:user)
      .permit(
        :role, 
        :email, 
        :latitude,
        :longitude,
        :zip_code,
        :adress, 
        :country, 
        :shop_id, 
        :password, 
        :current_password, 
        :password_confirmation
      )
  end

  def sign_up_params_verifications
    email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    errors = []
    normalized_errors = []
    if(sign_up_params[:email].match(email_regex) == nil)
      normalized_errors << "A1"
    end
    if(sign_up_params[:password].length <= 6)
      normalized_errors << "A2"
    end
    if(sign_up_params[:email].length == 0 )
      normalized_errors << "A3"
    end
    if(sign_up_params[:password].length == 0)
      normalized_errors << "A4"
    end
    if(User.where(email: sign_up_params[:email]).length != 0)
      normalized_errors << "A5"
    end
    if(normalized_errors.length == 0)
      return true
    else
      normalized_errors.map do |error|
        errors << I18n.t("error" + error)
      end
      render json: {
        "error_codes" => normalized_errors,
        "translated" => errors
      }, status: :bad_request
      return false
    end
  end
end
  # serializer ressources en json