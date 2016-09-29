class Event < ApplicationRecord
  belongs_to :organizer
  belongs_to :category

  has_many :competitions
  has_many :distances, dependent: :destroy
  accepts_nested_attributes_for :distances, allow_destroy: true

  validates :name, :city, :country, :date, :category_id, :organizer_id, presence: true
  mount_base64_uploader :logo, LogoUploader

  scope :past, -> { where('date < ?', Date.current) }
  scope :future, -> { where('date >= ?', Date.current) }
  scope :ready, -> { where(visible: true) }
end
