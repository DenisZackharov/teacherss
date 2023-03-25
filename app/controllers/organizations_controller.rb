class OrganizationsController < ApplicationController
  expose :organization

  before_action :authorize_organization

  private

  def authorize_organization
    authorize! organization
  end
end
