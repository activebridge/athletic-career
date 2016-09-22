class Length < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  scope :ready, -> { where(visible: true).order(mark: :asc) }

  has_many :distances
end
