class CompetitionsController < ApplicationController
  before_action :find_competition, only: [:show, :edit, :update, :destroy]
  def index
    @competitions = Competition.all
  end

  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params.merge(user_id: current_user.id))
    return redirect_to competitions_path if @competition.save
    render :new
  end

  def update
    return redirect_to competitions_path if @competition.update(competition_params)
    render :edit
  end

  def destroy
    @competition.destroy
    redirect_to competition_path, notice: 'Competition was successfully destroyed'
  end

  private

  def find_competition
    @competition = Competition.find(params[:id])
  end

  def competition_params
    params.require(:competition).permit(
      :race, :distance, :race_number, :result, :net_result, :rank, :category_rank, :year,
      :event_id, :city, :distance_id
    )
  end
end
