class SessionsController < ApplicationController
  def new; end

  def create
    User.create(vk_params)
    redirect(:root)
  end

  def destroy
    reset_session
    cookies.clear
    redirect(root_path)
  end


  private

  def vk_params
    {
      name: auth_hash[:info][:name],
      avatar: auth_hash[:extra][:raw_info][:photo_200_orig]
    }
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
