class Admin::SessionsController < AdminsController
  skip_before_action :require_admin

  def new
    @admin_session = Session.new
  end

  def create
    @admin_session = Session.new(params[:session])
    if @admin_session.valid?
      session[:admin] = true
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:admin)
    redirect(root_path)
  end
end
