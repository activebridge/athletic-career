class EventsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  helper_method :destroyable?

  expose :events, -> { Event.ready }
  expose :event

  def new
    event.distances.build
  end

  def create
    return redirect_to root_path if event.save
    render :new
  end

  def update
    return redirect_to root_path if event.update(event_params)
    render :edit
  end

  def destroy
    event.destroy
    redirect_to root_url
  end

  private

  def destroyable?
    current_admin || current_user.admin?
  end

  def event_params
    params.require(:event).permit(
      :name, :description, :site, :logo, :logo_cache, :city, :date, :banner, :country, :organizer_id, :category_id,
      distances_attributes: [:id, :_destroy, :event_id, :length_id, :title, :price, :end_price]
    )
  end
end
