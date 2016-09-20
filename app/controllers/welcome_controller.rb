class WelcomeController < ApplicationController
  if Rails.env.production?
    layout 'before_start'
    skip_before_action :require_admin
  else
    skip_before_action :require_user
  end

  def index
    @events = Event.all
  end
end
