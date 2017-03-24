require 'rails_helper'

feature 'Personal Best' do
  let!(:user) { create(:user) }
  let(:profile_page) { ProfilePage.new(user_path(user)) }
  # let(:attrs) { attributes_for(:user) }

  scenario 'Personal Best', js: true do
    profile_page.open
    expect(page).to have_content('Personal Best')
  end
end
