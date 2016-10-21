class UsersController < ApplicationController
  skip_before_action :require_user, only: [:index, :new, :create, :show]

  expose :users, -> { User.all.order('created_at desc') }
  expose :user, -> { User.friendly.find(params[:id]) }
  expose :competitions, -> { user.competitions.includes(:event) }

  def update
    return redirect_to user_path(current_user) if current_user.update(user_params)
    render :edit
  end

  def root_link
    "#{request.protocol}#{request.host}"
  end
  helper_method :root_link

  private

  def user_params
    params.require(:user).permit(:city, :category)
  end
end
