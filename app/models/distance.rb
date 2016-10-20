class Distance < ApplicationRecord
  # TODO: Find out why without required false event with accepted_newsted attributes does not create
  belongs_to :event, required: false
  belongs_to :length

  has_many :competitions

  validates :length_id, presence: true
  validates :price, numericality: { less_than_or_equal_to: :end_price }, allow_blank: true

  scope :uniq_counter, -> { all.includes(:length).group_by { |d| d.length.name } }

  def self.counter
    result = {}
    uniq_counter.each { |key, val| result[key.to_s] = val.count }
    result.sort { |a, b| b <=> a }
  end
end
