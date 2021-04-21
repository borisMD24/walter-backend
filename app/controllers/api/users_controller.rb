class Api::UsersController < Api::BaseController
  before_action :find_user, only: %w[show]
  before_action :authenticate_user!

  def show
    render_jsonapi_response(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end