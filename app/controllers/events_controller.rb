class EventsController < ApplicationController
  expose :events, -> { Event.all }
  expose :event

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
    params.require(:event).permit!.merge(user_id: current_user.id)
  end
end
