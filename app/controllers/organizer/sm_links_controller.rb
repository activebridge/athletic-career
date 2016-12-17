class Organizer::SmLinksController < OrganizersController
  expose :organizer, -> { Organizer.find(current_user.organizer_id) }
  expose :sm_links, -> { organizer.sm_link }
  expose :sm_link, -> { organizer.sm_link || organizer.build_sm_link }

  def create
    return redirect_to organizer_sm_links_path if sm_link.update(sm_link_params)
    render :new
  end

  def update
    create
  end

  def destroy
    sm_link.destroy
    redirect_to organizer_sm_links_path
  end

  private

  def sm_link_params
    params.require(:sm_link).permit!
  end
end
