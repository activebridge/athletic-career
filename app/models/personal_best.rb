class PersonalBest < ApplicationRecord
  WORLD_RECORDS = { km5: '00:12:37', km10: '00:26:44', km15: '00:41:13', half: '00:58:23', marathon: '02:02:57', ultra: '06:13:33' }
  belongs_to :user
  validate :long

  def long
    %w(km5 km10 km15 half marathon ultra).each do |distance|
      return true if send(distance).strftime('%T') == '00:00:00'
      send(distance).strftime('%T') < WORLD_RECORDS[distance.to_sym] ? errors.add(distance.to_sym, I18n.t('errors.record')) : true
    end
  end
end
