require 'rails_helper'

feature 'User' do
  let(:user) { create(:user) }
  let(:welcome_page) { WelcomePage.new }

  scenario 'Sign Up / Sign Out user with facebook', js: true do
    welcome_page.open
    expect(page).to have_content('Зареєструватися')
    welcome_page.login_with_facebook
    expect(page).to have_content('Мій профіль')
    click_link('Вийти')
    expect(page).to have_content('Зареєструватися')
  end

  scenario 'Sign Up / Sign Out user with vk', js: true do
    welcome_page.open
    expect(page).to have_content('Зареєструватися')
    welcome_page.login_with_vk
    expect(page).to have_content('Мій профіль')
    click_link('Вийти')
    expect(page).to have_content('Зареєструватися')
  end
end
