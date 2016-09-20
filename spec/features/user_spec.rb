require 'rails_helper'

feature 'User' do
  let(:user) { create(:user) }
  let(:welcome_page) { WelcomePage.new }

  # scenario 'Sign Up / Sign Out user with facebook', js: true do
  #   welcome_page.open
  #   expect(page).to have_content('Увійти')
  #   welcome_page.login_with_facebook
  #   expect(page).to have_content('test_username')
  #   click_link('test_username')
  #   expect(page).to have_content('Вийти')
  #   click_link('Вийти')
  #   expect(page).to have_content('Увійти')
  # end

  # scenario 'Sign Up / Sign Out user with vk', js: true do
  #   welcome_page.open
  #   expect(page).to have_content('Увійти')
  #   welcome_page.login_with_vk
  #   expect(page).to have_content('test_username')
  #   click_link('test_username')
  #   expect(page).to have_content('Вийти')
  #   click_link('Вийти')
  #   expect(page).to have_content('Увійти')
  # end
end
