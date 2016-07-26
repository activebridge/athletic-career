class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { minimum: 3, maximum: 18 }

  scope :ready, -> { where(visible: true) }
end
