require 'rails_helper'

feature 'AdminSession' do
  let(:articles_page) { Admin::ArticlesPage.new }
  let(:attrs) { attributes_for(:article) }
  let(:attrs1) { attributes_for(:article, title: 'Another title') }

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
    click_link I18n.t('.links.show')
    expect(page).to have_content(attrs[:body])
    articles_page.open
    click_link I18n.t('.links.edit')
    expect(page).to have_content(I18n.t('.admin.articles.edit.title'))
    articles_page.fill_form(attrs1, true)
    articles_page.wait_js_execution
    expect(page).to have_content(attrs1[:title])
    click_link I18n.t('.links.delete')
    expect(page).to_not have_content(attrs1[:title])
  end
end
