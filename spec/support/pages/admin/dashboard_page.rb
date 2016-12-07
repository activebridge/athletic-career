require 'support/base_page'

class Admin::DashboardPage < BasePage
  def open
    visit admin_dashboard_path
    self
  end
end
