class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect(path)
    if request.xhr?
      redirect_via_turbolinks_to path
    else
      redirect_to path
    end
  end
end
