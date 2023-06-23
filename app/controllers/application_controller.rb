class ApplicationController < ActionController::Base
  include Authenticate
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?
end
