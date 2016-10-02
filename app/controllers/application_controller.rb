class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :require_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    reset_session
  end
  helper_method :current_user

  def current_admin
    session[:admin]
  end
  helper_method :current_admin

  def require_user
    unless current_user
      respond_to do |format|
        format.html do
          redirect_to root_path, notice: t('notify')
        end
      end
    end
  end

  def require_admin
    return true if current_admin || current_user&.admin?
    redirect(root_path)
  end

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def redirect(path)
    if request.xhr?
      redirect_via_turbolinks_to path
    else
      redirect_to path
    end
  end
end
