class EventsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]

  expose :events, -> { Event.ready }
  expose :event
  expose :show_event, -> { Event.friendly.find(params[:id]) }
  expose :past_events, -> { events.past.search(params[:search]).order('date desc') }
  expose :future_events, -> { events.future.search(params[:search]).order('date asc') }
  expose :index_events, -> { params[:type] == 'past' ? past_events : future_events }

  def new
    event.distances.build
  end

  def create
    if event.save
      redirect_to root_path, notice: t('.event_created')
    else
      render :new
    end
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

  def event_params
    params.require(:event).permit(
      :name, :description, :site, :logo, :logo_cache, :city, :date, :banner, :country, :organizer_id, :category_id,
      distances_attributes: [:id, :_destroy, :event_id, :length_id, :price, :end_price, :title]
    )
  end
end
