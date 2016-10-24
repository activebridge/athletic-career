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
end
