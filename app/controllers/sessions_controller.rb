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
    { name: auth_hash[:info][:name] }
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
