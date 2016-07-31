class Distance < ApplicationRecord
  # TODO: Find out why without required false event with accepted_newsted attributes does not create
  belongs_to :event, required: false
  belongs_to :length

  validates :length_id, presence: true
end
