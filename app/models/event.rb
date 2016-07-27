class Event < ApplicationRecord
  belongs_to :organizer
  belongs_to :category

  has_many :distances

  mount_base64_uploader :logo, LogoUploader
end
