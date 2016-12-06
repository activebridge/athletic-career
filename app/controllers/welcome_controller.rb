class WelcomeController < ApplicationController
  skip_before_action :require_user

  expose :events, -> { Event.ready }
  expose :banners, -> { Banner.ready.order(priority: :asc) }
end
