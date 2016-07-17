class Event < ApplicationRecord
  belongs_to :user

  mount_base64_uploader :logo, LogoUploader
end
