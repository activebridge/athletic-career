class Career < ApplicationRecord
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, reject_if: proc { |a| a[:title].blank? }, allow_destroy: true
end
