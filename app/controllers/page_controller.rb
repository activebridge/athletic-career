class PageController < ApplicationController
  skip_before_action :require_user

  def show
    render params[:page]
  end
end
