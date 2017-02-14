class DistancesController < ApplicationController
  skip_before_action :require_user
  expose :distance, -> { Distance.find(params[:distance]) }
  expose :results, -> { distance.results }
end
