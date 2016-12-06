class Banner < ApplicationRecord
  mount_base64_uploader :image, BannerUploader
  scope :ready, -> { where(visible: true) }
end
