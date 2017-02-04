class Protocol < ApplicationRecord
  belongs_to :user
  validates :year, presence: true
  validates :first_name_ua, presence: true, if: :last_name_ua?
  validates :last_name_ua, presence: true, if: :first_name_ua?
  validates :first_name_ru, presence: true, if: :last_name_ru?
  validates :last_name_ru, presence: true, if: :first_name_ru?
  validates :first_name_en, presence: true, if: :last_name_en?
  validates :last_name_en, presence: true, if: :first_name_en?
end
