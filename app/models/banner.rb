class Banner < ApplicationRecord
  mount_base64_uploader :image, BannerUploader
  scope :ready, -> { where(visible: true) }
  paginates_per 10

  validates :name, :visible, :priority, :image, presence: true
  validates :name, uniqueness: true
end
