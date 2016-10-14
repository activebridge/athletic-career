class Admin::UsersController < AdminsController
  expose :users, -> { User.all }
  expose :user, -> { User.friendly.find(params[:id]) }

  def destroy
    user.destroy
    redirect admin_dashboard_path
  end
end
