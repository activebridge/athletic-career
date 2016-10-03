class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  expose :users, -> { User.all }
  expose :user, -> { User.friendly.find(params[:id]) }
  expose :competitions, -> { user.competitions.includes(:event) }
end
