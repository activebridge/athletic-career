class EventsController < ApplicationController
  before_action :event, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy] if Rails.env.development? || Rails.env.test?
  helper_method :destroyable?

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @event.distances.build
  end

  def create
    @event = Event.new(event_params)
    return redirect_to events_path if @event.save
    render :new
  end

  def update
    return redirect_to events_path if @event.update(event_params)
    render :edit
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def destroyable?
    current_admin || current_user.admin?
  end

  def event
    @event ||= Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :name, :description, :site, :logo, :logo_cache, :city, :date, :banner, :country, :organizer_id, :category_id,
      distances_attributes: [:id, :_destroy, :event_id, :length_id, :title, :price, :end_price]
    )
  end
end
