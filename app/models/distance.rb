class Distance < ApplicationRecord
  # TODO: Find out why without required false event with accepted_newsted attributes does not create
  belongs_to :event, required: false
  belongs_to :length, required: false

  validates :title, :price, presence: true
end
