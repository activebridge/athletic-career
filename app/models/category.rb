class Category < ApplicationRecord
  scope :ready, -> { where(visible: true) }
end
