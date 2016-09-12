class Competition < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :user_competition, -> (user_id) { where('user_id = ?', user_id) }
end
