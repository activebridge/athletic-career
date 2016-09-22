class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  expose :users, -> { User.all }
  expose :user
  expose :competitions, -> { user.competitions }
end
