class User < ApplicationRecord
  has_many :events, dependent: :delete_all
  has_many :accounts, dependent: :delete_all

  enum role: [:user, :admin]

  scope :find_by_provider_uid, -> (provider, uid) { joins(:accounts).where(accounts: { provider: provider, uid: uid }) }

  def self.fetch_account(account_params, user_params)
    user = find_by_provider_uid(account_params[:provider], account_params[:uid])
    return user.first if user.present?
    return if find_by('lower(name) = ?', account_params[:name].downcase)
    user = create(user_params)
    user.accounts.create(account_params)
    user
  end
end
