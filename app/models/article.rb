class Article < ApplicationRecord
  extend FriendlyId
  mount_base64_uploader :image, ImageUploader
  friendly_id :title, use: [:slugged, :finders]
  paginates_per 10

  validates :title, :body, :image, presence: true
  validates :title, uniqueness: true

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
