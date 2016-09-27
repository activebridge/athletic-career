class Admin::EventsController < ApplicationController
  expose :events, -> { Event.all }
  expose :event

  def create
    return redirect_to admin_events_path if event.update(event_params)
    render :new
  end

  def update
    create
  end

  def destroy
    event.destroy
    redirect_to admin_events_url
  end

  private

  def event_params
    params.require(:event).permit!
  end
end
