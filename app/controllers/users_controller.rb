class UsersController < ApplicationController
  skip_before_action :require_user, only: [:index, :new, :create, :show]

  expose :users, -> { User.all }
  expose :user, -> { User.friendly.find(params[:id]) }
  expose :competitions, -> { user.competitions.includes(:event) }

  def root_link
    "#{request.protocol}#{request.host}"
  end
  helper_method :root_link
end
