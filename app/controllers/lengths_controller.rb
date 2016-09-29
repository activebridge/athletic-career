class LengthsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  expose :lengths, -> { Length.all.order(mark: :asc) }
  expose :length
  expose :events, -> { Event.joins(:distances).where(distances: { length_id: length.id }) }

  def create
    return redirect_to lengths_path if length.update(length_params)
    render :new
  end

  def update
    create
  end

  def destroy
    length.destroy
    redirect_to lengths_url, notice: t('length_destroyed')
  end

  private

  def length_params
    params.require(:length).permit!
  end
end
