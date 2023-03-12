class CompaniesController < ApplicationController
  expose :company

  before_action :authorize_company

  private

  def authorize_company
    authorize! company
  end
end
