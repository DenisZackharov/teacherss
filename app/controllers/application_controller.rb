class ApplicationController < ActionController::Base
  include Authenticate

  before_action :configure_permitted_parameters, if: :devise_controller?
end
