class Distance < ApplicationRecord
  # TODO: Find out why without required false event with accepted_newsted attributes does not create
  belongs_to :event, required: false
  belongs_to :length

  validates :length_id, presence: true
  validates :price, numericality: { less_than_or_equal_to: :end_price }, allow_blank: true
end
