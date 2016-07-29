class EventsController < ApplicationController
  expose :events, -> { Event.all }
  expose :event

  def new
    event.distances.build
  end

  def create
    return redirect_to events_path if event.update(event_params)
    render :new
  end

  def update
    create
  end

  def destroy
    event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :description, :site, :logo, :city, :date, :banner, :country, :organizer_id, :category_id,
      distances_attributes: [:event_id, :title, :price, :_destroy]
    )
  end
end
