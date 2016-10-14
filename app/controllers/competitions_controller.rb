class CompetitionsController < ApplicationController
  expose :competitions, -> { current_user.competitions.includes(:event) }
  expose :competition
  expose :distance, -> { Distance.find_by(params[:distance]) }
  expose :event, -> { distance.event }

  def create
    @competition = Competition.new(competition_params.merge(user_id: current_user.id))
    if @competition.save
      redirect_to competitions_path, notice: t('.competition_created')
    else
      render :new
    end
  end

  def update
    return redirect_to competitions_path if competition.update(competition_params)
    render :edit
  end

  def destroy
    competition.destroy
    redirect_to user_path(current_user), notice: t('.competition_destroyed')
  end

  private

  def competition_params
    params.require(:competition).permit(
      :race, :distance, :race_number, :result, :net_result, :rank, :category_rank, :year,
      :event_id, :city, :distance_id
    )
  end

  def runner_params
    { user_id: current_user.id, year: event.date.year, city: event.city, event_id: event.id, distance_id: distance.id }
  end
end
