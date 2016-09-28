class WelcomeController < ApplicationController
  layout 'before_start'
  skip_before_action :require_user

  expose :events, -> { Event.ready }
end
