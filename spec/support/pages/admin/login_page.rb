require 'support/base_page'

class Admin::LoginPage < BasePage
  def open
    visit new_admin_session_path
    self
  end
end
