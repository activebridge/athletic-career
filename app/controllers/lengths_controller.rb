class LengthsController < ApplicationController
  before_action :require_user, except: [:index, :show]
  expose :lengths, -> { Length.all.order(mark: :asc) }
  expose :length
  expose :events, -> { Event.by_length(length) }
  expose :ready_length, -> { Length.ready }

  def create
    if length.update(length_params)
      redirect_to lengths_path, notice: t('length_created')
    else
      render :new
    end
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
