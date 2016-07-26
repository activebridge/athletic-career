class Category < ApplicationRecord
  has_many :events, dependent: :delete_all

  validates :title, presence: true, uniqueness: true, length: { minimum: 3, maximum: 18 }

  scope :ready, -> { where(visible: true) }
end
