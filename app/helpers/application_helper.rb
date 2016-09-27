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
      cl_image_tag event.logo.url(:large)
    else
      image_tag('default.jpg')
    end
  end
end
