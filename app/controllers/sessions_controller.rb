class SessionsController < ApplicationController
  include SessionMethods

  skip_before_action :require_user

  def new; end

  def create
    user = User.fetch_account(account_params, user_params)
    session[:user_id] = user.id
    redirect(:root)
  end

  def destroy
    reset_session
    cookies.clear
    redirect(root_path)
  end


  private

  def user_params
    {
      name: auth_hash[:info][:name],
      avatar: client_avatar(auth_hash[:provider]),
      email: auth_hash[:info][:email]
    }
  end

  def account_params
    {
      provider: auth_hash[:provider],
      user_id: current_user&.id,
      uid: auth_hash[:uid],
      token: auth_hash[:credentials][:token],
      name: auth_hash[:info][:name]
    }
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
