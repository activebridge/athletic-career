class PersonalBestsController < ApplicationController
  expose :personal_best, -> { current_user.personal_best || current_user.build_personal_best }

  def create
    return redirect_to user_path(current_user) if personal_best.update(personal_best_params)
    render :new
  end

  def update
    create
  end

  private

  def personal_best_params
    params.require(:personal_best).permit!
  end
end
