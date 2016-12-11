class Organizer::MembersController < OrganizersController
  expose :members, -> { Member.all }
  expose :member

  def create
    return redirect_to organizer_members_path if member.update(member_params)
    render :new
  end

  def update
    create
  end

  def destroy
    member.destroy
    redirect_to organizer_members_url
  end

  private

  def member_params
    params.require(:member).permit!
  end
end
