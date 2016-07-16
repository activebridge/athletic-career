class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  private

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
