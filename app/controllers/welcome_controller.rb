class WelcomeController < ApplicationController
  layout 'before_start'
  skip_before_action :require_user

  def index
    @events = Event.all
  end
end
