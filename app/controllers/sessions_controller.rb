class SessionsController < ApplicationController
  include SessionMethods

  skip_before_action :require_user

  def new; end

  def create
    user = User.fetch_account(account_params, user_params)
    session[:user_id] = user.id
    redirect_to new_protocol_path, notice: t('.succesfull')
  end

  def destroy
    reset_session
    cookies.clear
    redirect_to root_path, notice: t('.succesfull')
  end

  private

  def user_params
    {
      remote_avatar_url: client_avatar(auth_hash[:provider]),
      email: auth_hash[:info][:email],
      gender: user_gender(auth_hash[:provider]),
      profile: user_url(auth_hash[:provider])
    }.merge(account_params)
  end

  def account_params
    {
      provider: auth_hash[:provider],
      uid: auth_hash[:uid],
      token: auth_hash[:credentials][:token],
      name: auth_hash[:info][:name]
    }
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
