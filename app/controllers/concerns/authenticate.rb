module Authenticate
  extend ActiveSupport::Concern

  SIGN_UP_PARAMS = %i[first_name last_name email password password_confirmation].freeze
  UPDATE_PARAMS = %i[first_name last_name role email password].freeze

  included do
    helper do
      def current_user
        super.decorate if user_signed_in?
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: SIGN_UP_PARAMS)
    devise_parameter_sanitizer.permit(:account_update, keys: UPDATE_PARAMS)
  end

  protected

  def account_update_params
    params = devise_parameter_sanitizer.sanitize(:account_update)

    if passwords_blank?(params)
      params.except(:password, :password_confirmation)
    else
      params
    end
  end

  def passwords_blank?(params)
    params[:password].blank? && params[:password_confirmation].blank?
  end
end
