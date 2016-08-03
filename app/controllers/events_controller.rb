class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy]
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

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :name, :description, :site, :logo, :city, :date, :banner, :country, :organizer_id, :category_id,
      distances_attributes: [:id, :_destroy, :event_id, :length_id, :title, :price, :end_price]
    )
  end
end
