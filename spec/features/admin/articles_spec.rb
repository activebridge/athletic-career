require 'rails_helper'

feature 'AdminSession' do
  let(:articles_page) { Admin::ArticlesPage.new }
  let(:attrs) { attributes_for(:article) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(true)
  end

  scenario 'CRUD Admin Articles', js: true do
    articles_page.open
    expect(page).to have_content(I18n.t('.admin.articles.index.title'))
    click_link I18n.t('.links.new_article')
    expect(page).to have_content(I18n.t('.admin.articles.new.title'))
    articles_page.fill_form(attrs)
    articles_page.wait_js_execution
    expect(page).to have_content(attrs[:title])
  end
end
