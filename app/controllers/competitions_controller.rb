class CompetitionsController < ApplicationController
  helper_method :destroyable?

  expose :competitions, -> { current_user.competitions.includes(:event) }
  expose :competition

  def create
    @competition = Competition.new(competition_params.merge(user_id: current_user.id))
    if @competition.save
      redirect_to competitions_path, notice: t('competition_created')
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
    redirect_to competition_path, notice: 'Competition was successfully destroyed'
  end

  private

  def destroyable?
    current_admin || current_user.admin? || competition.user_id == current_user.id
  end

  def competition_params
    params.require(:competition).permit(
      :race, :distance, :race_number, :result, :net_result, :rank, :category_rank, :year,
      :event_id, :city, :distance_id
    )
  end
end
