class ResultJob < ActiveJob::Base
  include ResultMethods

  def perform(protocol, results)
    # year = protocol.birthday.year
    list = list(protocol)
    return if list.blank?
    competitions = competitions(list, results)
    return if competitions.blank?
    finish(competitions, protocol)
  end

  private

  def competitions(list, results)
    competitions = []
    list.each { |name| competitions += results.where(name: name) }
    competitions
  end
end
