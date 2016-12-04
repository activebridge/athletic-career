class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :organizer
  belongs_to :category

  has_many :competitions
  has_many :distances, dependent: :destroy
  accepts_nested_attributes_for :distances, allow_destroy: true

  paginates_per 8
  mount_base64_uploader :logo, LogoUploader

  validates :name, :city, :country, :date, :category_id, :organizer_id, presence: true

  scope :past, -> { where('date < ?', Date.current) }
  scope :future, -> { where('date >= ?', Date.current) }
  scope :ready, -> { where(visible: true) }
  scope :by_length, -> (length) { joins(:distances).where(distances: { length_id: length.id }) }

  query = lambda do |params|
    return if params.blank?
    all
      .by_date(params[:date])
      .by_city(params[:city])
      .by_organizer(params[:organizer_id])
  end

  scope :search, query
  scope :by_date, -> (date) { where('extract(year from date) = ?', date.to_s) unless date.blank? }
  scope :by_city, -> (city) { where(city: city) unless city.blank? }
  scope :by_organizer, -> (organizer) { where(organizer_id: organizer) unless organizer.blank? }

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
