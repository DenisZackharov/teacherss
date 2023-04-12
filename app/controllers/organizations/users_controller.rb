module Organizations
  class UsersController < ApplicationController
    before_action :authorize!
    expose :users, -> { UserDecorator.decorate_collection(fetch_users) }

    def index; end

    private

    def fetch_users
      current_user.organization.users
    end
  end
end
