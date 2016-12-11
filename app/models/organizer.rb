class Organizer < ApplicationRecord
  has_many :events, dependent: :delete_all
  has_one :member

  validates :title, presence: true, uniqueness: true

  scope :ready, -> { where(visible: true) }
end
