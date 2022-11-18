module Authenticate
  SIGN_UP_PARAMS = %i[first_name last_name email password password_confirmation].freeze

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: SIGN_UP_PARAMS)
  end
end
