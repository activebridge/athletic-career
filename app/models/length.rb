class Length < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  scope :ready, -> { where(visible: true) }

  has_many :distances
end
