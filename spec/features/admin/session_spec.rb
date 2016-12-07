require 'rails_helper'

feature 'AdminSession' do
  let!(:admin) { { email: Rails.application.secrets.admin_username, password: Rails.application.secrets.admin_password } }
  let(:login_page) { Admin::LoginPage.new }

  scenario 'Log In/Log Out Admin Panel', js: true do
    login_page.open
    fill_in 'session[email]', with: admin[:email]
    fill_in 'session[password]', with: admin[:password]
    click_button 'login'
    login_page.wait_js_execution
    expect(page).to have_no_css('.error')
    # expect(page).to have_content(I18n.t('.admin.dashboards.show.users_count')) WTF????
  end
end
