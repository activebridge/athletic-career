class Category < ApplicationRecord
  has_many :events, dependent: :delete_all

  validates :title, presence: true, uniqueness: true

  scope :ready, -> { where(visible: true) }
end
