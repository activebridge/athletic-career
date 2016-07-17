class LanguagesController < ApplicationController
  skip_before_action :require_user

  def update
    session[:locale] = params[:id]
    redirect_to :back
  end
end
