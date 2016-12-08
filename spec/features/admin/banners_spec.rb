require 'rails_helper'

feature 'AdminBanners' do
  let(:banners_page) { Admin::BannersPage.new }
  let(:attrs) { attributes_for(:banner) }
  let(:attrs1) { attributes_for(:banner, name: 'Another name') }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(true)
  end

  scenario 'CRUD Admin Banners', js: true do
    banners_page.open
    expect(page).to have_content(I18n.t('.admin.banners.index.title'))
    click_link I18n.t('.links.new_banner')
    expect(page).to have_content(I18n.t('.admin.banners.new.title'))
    banners_page.fill_form(attrs)
    banners_page.wait_js_execution
    expect(page).to have_content(attrs[:name])
    click_link I18n.t('.links.show')
    expect(page).to have_content(attrs[:priority])
    banners_page.open
    click_link I18n.t('.links.edit')
    expect(page).to have_content(I18n.t('.admin.banners.edit.title'))
    banners_page.fill_form(attrs1)
    banners_page.wait_js_execution
    expect(page).to have_content(attrs1[:name])
    click_link I18n.t('.links.delete')
    expect(page).to_not have_content(attrs1[:name])
  end
end
