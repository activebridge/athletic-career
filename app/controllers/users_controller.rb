class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  expose :users, -> { User.all }
  expose :user

  def index; end

  def show
    @competitions = Competition.user_competition(user.id)
  end
end
