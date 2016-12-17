class Organizer < ApplicationRecord
  has_many :events, dependent: :delete_all
  has_one :member
  has_one :sm_link, as: :sm_linkable

  validates :title, presence: true, uniqueness: true

  scope :ready, -> { where(visible: true) }
end
