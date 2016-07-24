class Session
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :email, :password

  validates :email, :password, presence: true
  validate :credentials

  def initialize(attrs = {})
    attrs ||= {}
    attrs.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  private

  def credentials
    return false if password.blank?
    secrets = Rails.application.secrets
    errors.add(:email, :invalid) unless email == secrets.admin_username || password == secrets.admin_password
  end
end
