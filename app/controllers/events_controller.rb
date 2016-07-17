class EventsController < ApplicationController
  expose :events, -> { Event.all }
  expose :event

  def create
    if event.update(event_params)
      redirect_to event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if event.update(event_params)
      redirect_to event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
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
