class LoginJob < ActiveJob::Base
  def perform(protocol)
    # year = protocol.year.year
    list = list(protocol)
    return if list.blank?
    competitions = competitions(list)
    return if competitions.blank?
    finish(competitions, protocol)
  end

  private

  def list(protocol)
    names = []
    %w(ua ru en).each do |language|
      if protocol.send("first_name_#{language}").present?
        names += info(protocol, language)
      end
    end
    names
  end

  def competitions(list)
    competitions = []
    list.each { |name| competitions += Result.where(name: name) }
    competitions
  end

  def finish(competitions, protocol)
    competitions.each do |result|
      Competition.create(user: protocol.user, distance_id: result.distance_id, event_id: event_comp(result.distance_id), race_number: result.bib_number, net_result: result.chip_time, rank: result.position, category_rank: result.category_position) unless condition(protocol.user, result.distance_id)
    end
  end

  def event_comp(distance)
    Distance.find(distance).event_id
  end

  def condition(user, distance)
    user.competitions.map(&:distance_id).include?(distance)
  end

  def info(protocol, language)
    [protocol.send("first_name_#{language}").downcase + ' ' + protocol.send("last_name_#{language}").downcase, protocol.send("last_name_#{language}").downcase + ' ' + protocol.send("first_name_#{language}").downcase]
  end
end
