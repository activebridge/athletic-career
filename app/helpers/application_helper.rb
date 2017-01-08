module ApplicationHelper
  def current_locale?(locale)
    I18n.locale == locale
  end

  def nav_link(text, path)
    link_to_unless_current text, path do
      content_tag :span, text
    end
  end

  def personal_best_link
    return link_to :edit_personal_best, edit_personal_best_path if user.personal_best
    link_to :new_personal_best, new_personal_best_path
  end

  def personal_time(time, distance)
    res_time = "#{time.hour.to_s.rjust(2, '0')}:#{time.min.to_s.rjust(2, '0')}:#{time.sec.to_s.rjust(2, '0')}"
    return { time: '-', temp: '-', speed: '-' } if res_time == '00:00:00'
    temp = temp(time, distance)
    { time: res_time, temp: temp, speed: speed(time, distance) }
  end

  def temp(time, distance)
    temp = race_temp(time, distance)
    sec_temp = 0.6 * temp.divmod(1).last
    result = temp.to_i + sec_temp.round(2)
    format('%.2f', result).tr('.', ':')
  end

  def speed(time, distance)
    speed = 3600 / ((time.hour * 3600 + time.min * 60 + time.sec) / distance)
    format('%.2f', speed.round(2)).tr('.', ':')
  end

  def race_temp(time, distance)
    ((time.hour * 3600 + time.min * 60 + time.sec) / distance) / 60
  end

  def event_logo(event)
    if event.logo.present?
      cl_image_tag event.logo
    else
      image_tag('default.png')
    end
  end

  def distance_title(distance)
    return distance.title if distance.title
    distance.length.name
  end

  def distance_list(event)
    event.distances.includes(:length).map { |d| [d.length.title, d.id] }
  end

  def find_distance(id)
    distance = Distance.find(id)
    distance.length.title
  end

  def run_link?(id)
    result = current_user.competitions.map(&:distance_id)
    result.include?(id)
  end
end
