class Length < ApplicationRecord
  scope :ready, -> { where(visible: true) }
end
