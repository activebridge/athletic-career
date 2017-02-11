class ResultsController < ApplicationController
  skip_before_action :require_user
  expose :distance
  expose :result, -> { distance.results }
end
