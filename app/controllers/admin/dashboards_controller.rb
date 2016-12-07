class Admin::DashboardsController < AdminsController
  expose :users_count, -> { User.count }
  def show; end
end
