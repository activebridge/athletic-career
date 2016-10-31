module ApplicationHelper
  def current_locale?(locale)
    I18n.locale == locale
  end

  def nav_link(text, path)
    link_to_unless_current text, path do
      content_tag :span, text
    end
  end

  def event_logo(event)
    if event.logo.present?
      cl_image_tag event.logo
    else
      image_tag('default.png')
    end
  end

  def distance_list(event)
    event.distances.includes(:length).map { |d| [d.length.title, d.id] }
  end

  def find_distance(id)
    distance = Distance.find(id)
    distance.length.title
  end

  def run_link?(id, event)
    return true unless event.date < DateTime.now
    result = current_user.competitions.map(&:distance_id)
    result.include?(id)
  end
end
