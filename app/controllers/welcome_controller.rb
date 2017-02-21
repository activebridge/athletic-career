class WelcomeController < ApplicationController
  skip_before_action :require_user

  expose :events, -> { Event.ready }
  expose :banners, -> { Banner.ready.order(priority: :asc) }
  expose :future_events, -> { events.future.order('date asc').first(4) }
  expose :past_events, -> { events.past.order('date desc').first(4) }
end
