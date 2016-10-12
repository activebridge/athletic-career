class Admin::EventsController < AdminsController
  expose :events, -> { Event.all }
  expose :event
  expose :show_event, -> { Event.friendly.find(params[:id]) }

  def create
    if event.save
      redirect_to admin_events_path, notice: t('.event_created')
    else
      render :new
    end
  end

  def update
    return redirect_to admin_events_path if show_event.update(event_params)
    render :edit
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
