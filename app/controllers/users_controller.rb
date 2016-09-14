class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :competitions, only: :show

  expose :users, -> { User.all }
  expose :user

  def index; end

  private

  def competitions
    @competitions ||= user.competitions
  end
end
