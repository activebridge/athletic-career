class Admin::UsersController < AdminsController
  expose :users, -> { User.all }
  expose :user, -> { User.friendly.find(params[:id]) }

  def update
    return redirect_to admin_users_path if user.update(user_params)
    render :edit
  end

  def destroy
    user.destroy
    redirect admin_dashboard_path
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
