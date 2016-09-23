class Length < ApplicationRecord
  has_many :distances

  validates :title, presence: true, uniqueness: true
  mount_base64_uploader :logo, LogoUploader

  scope :ready, -> { where(visible: true).order(mark: :asc) }
end
