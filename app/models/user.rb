class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  AGE = { '16-39' => 1, '40-49' => 2, '50-59' => 3, '60+' => 4 }

  has_many :competitions, dependent: :delete_all
  has_many :distances, through: :competitions
  has_one :personal_best, dependent: :destroy
  has_one :protocol, dependent: :destroy

  enum role: [:user, :organizer]

  scope :find_by_provider_uid, -> (provider, uid) { where(provider: provider, uid: uid) }

  paginates_per 15
  mount_base64_uploader :avatar, AvatarUploader

  def self.fetch_account(account_params, user_params)
    user = find_by_provider_uid(account_params[:provider], account_params[:uid])
    return improve(user.first, user_params) if user.present?
    return if find_by('lower(name) = ?', account_params[:name].downcase)
    user = create(user_params)
    user
  end

  def self.improve(user, user_params)
    user.update(token: user_params[:token], remote_avatar_url: user_params[:remote_avatar_url], name: user_params[:name])
    user
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

  def guman_category
    AGE.index(category)
  end
end
