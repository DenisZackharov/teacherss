module Organizations
  class UsersController < ApplicationController
    before_action :authorize_user, only: %i[index]
    expose :users, -> { UserDecorator.decorate_collection(fetch_users) }

    def index; end

    private

    def fetch_users
      current_user.organization.users
    end

    def authorize_user
      authorize!
    end
  end
end
