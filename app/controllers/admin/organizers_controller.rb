class Admin::OrganizersController < AdminsController
  expose :organizers, -> { Organizer.all }
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
    redirect_to admin_organizers_url, notice: 'Organizer was successfully destroyed.'
  end

  private

  def organizer_params
    params.require(:organizer).permit!
  end
end
