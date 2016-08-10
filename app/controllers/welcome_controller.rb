class WelcomeController < ApplicationController
  skip_before_action :require_user

  def index
    @events = Event.all
  end
end
