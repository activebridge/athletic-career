require 'rails_helper'

feature 'User' do
  let(:user) { create(:user) }
  let(:welcome_page) { WelcomePage.new }
  let(:attrs) { attributes_for(:user) }

  scenario 'Sign Up facebook', js: true do
    welcome_page.open
    welcome_page.login_with_facebook
    expect(page).to have_content('Рік народження')
    find('a.signout', visible: false).trigger :click
    welcome_page.wait_js_execution
    expect(page).to_not have_content(user.name)
  end

  scenario 'Sign Up vk', js: true do
    welcome_page.open
    welcome_page.login_with_vk
    welcome_page.wait_js_execution
    expect(page).to have_content('Рік народження')
    find('a.signout', visible: false).trigger :click
    welcome_page.wait_js_execution
    expect(page).to_not have_content(user.name)
  end
end
