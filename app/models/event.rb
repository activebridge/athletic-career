class Event < ApplicationRecord
  belongs_to :organizer
  belongs_to :category

  mount_base64_uploader :logo, LogoUploader
end
