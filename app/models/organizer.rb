class Organizer < ApplicationRecord
  scope :ready, -> { where(visible: true) }
end
