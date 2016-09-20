require 'rails_helper'

feature 'User' do
  let(:user) { create(:user) }
  let(:welcome_page) { WelcomePage.new }
end
