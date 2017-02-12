class DistancesController < ApplicationController
  skip_before_action :require_user
  expose :event, -> { Event.friendly.find(params[:id]) }
  expose :distance
  expose :results, -> { distance.results }
end
