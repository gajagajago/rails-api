class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: [:create]

  def create
    user = User.new(user_parms)

    if user.save
      json_response("success", true, { user: user }, :ok)
    else
      json_response("fail", false, {}, :unprocessable_entity)
    end
  end

  private
  def user_parms
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def ensure_params_exist
    unless params[:user].present?
      json_response("missing params", false, {}, :bad_request)
    end
  end
end
