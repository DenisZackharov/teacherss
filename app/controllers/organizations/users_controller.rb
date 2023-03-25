module Organizations
  class UsersController < ApplicationController
    expose :users, -> { UserDecorator.decorate_collection(fetch_users) }

    private

    def fetch_users
      current_user.organization.users
    end
  end
end
