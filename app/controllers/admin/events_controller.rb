class Admin::EventsController < AdminsController
  expose :events, -> { Event.all.order(created_at: :desc).page(params[:page]) }
  expose :event
  expose :show_event, -> { Event.friendly.find(params[:id]) }
  expose :past_events, -> { events.past }
  expose :future_events, -> { events.future }
  expose :index_events, -> { params[:type] == 'past' ? past_events : future_events }
  expose :distances, -> { show_event.distances }

  def create
    return redirect_to admin_events_path if event.save
    render :new
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
