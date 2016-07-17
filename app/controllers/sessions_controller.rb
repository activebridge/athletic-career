class SessionsController < ApplicationController
  include SessionMethods

  skip_before_action :require_user

  def new; end

  def create
    return redirect(:root) if create_account
    User.fetch_account(account_params, user_params)
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
      avatar: auth_hash[:extra][:raw_info][:photo_200_orig]
    }
  end

  def account_params
    {
      provider: auth_hash[:provider],
      user_id: current_user&.id,
      uid: client_uid(auth_hash[:provider]),
      token: client_token(auth_hash[:provider]),
      name: client_username(auth_hash[:provider])
    }
  end

  def create_account
    return false unless auth_hash['page'] == 'Account'
    Account.create!(account_params)
    redirect :root
    true
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
