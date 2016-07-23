require 'rails_helper'

feature 'User' do
  let(:user) { create(:user) }
  let(:welcome_page) { WelcomePage.new }

  scenario 'Sign Up / user edit', js: true do
    welcome_page.open
    expect(page).to have_content('Зареєструватися')
    welcome_page.login_with(:facebook)
    expect(page).to have_content('Мій профіль')
  end
end
