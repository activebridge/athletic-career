class EventsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]

  expose :events, -> { Event.ready }
  expose :event
  expose :show_event, -> { Event.friendly.find(params[:id]) }
  expose :search_event, -> { Event.ready.search(params[:search]).order('date desc') }
  expose :future_search_event, -> { Event.ready.future.search(params[:search]).order('date asc') }

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
      distances_attributes: [:id, :_destroy, :event_id, :length_id, :price, :end_price]
    )
  end
end
