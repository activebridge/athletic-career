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

  def require_user
    redirect(root_path) unless current_user
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
