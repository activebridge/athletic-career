module ApplicationHelper
  def current_locale?(locale)
    I18n.locale == locale
  end

  def nav_link(text, path)
    link_to_unless_current text, path do
      content_tag :span, text
    end
  end
end
