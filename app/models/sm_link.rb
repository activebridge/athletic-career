class SmLink < ApplicationRecord
  belongs_to :sm_linkable, polymorphic: true
  validate :correct_link, :google_link

  def correct_link
    %w(facebook instagram twitter vk).each do |name|
      return true if send(name).blank?
      send(name).include?("https://#{name}.com/") || send(name).include?("https://www.#{name}.com/") ? true : errors.add(name.to_sym, I18n.t("errors.#{name}.message"))
    end
  end

  def google_link
    return true if google.blank?
    google.include?('https://plus.google.com/') || google.include?('https://www.plus.google.com/') ? true : errors.add(:google, I18n.t('errors.google.message'))
  end
end
