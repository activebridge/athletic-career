class Admin::OrganizersController < AdminsController
  expose :organizers, -> { Organizer.all.order(created_at: :desc).page(params[:page]) }
  expose :organizer

  def create
    return redirect_to admin_organizers_path if organizer.update(organizer_params)
    render :new
  end

  def update
    create
  end

  def destroy
    organizer.destroy
    redirect_to admin_organizers_url
  end

  private

  def organizer_params
    params.require(:organizer).permit!
  end
end
