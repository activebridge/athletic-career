require 'support/base_page'

class Admin::ArticlesPage < BasePage
  def open
    visit admin_articles_path
    self
  end

  def fill_form(params)
    within 'form' do
      fill_in 'article[title]', with: params[:title]
      fill_in 'article[body]', with: params[:body], visible: false
      find_button(I18n.t('.admin.articles.form.submit'), match: :first).trigger(:click)
    end
    self
  end

  def fill_form_edit(params)
    within 'form' do
      fill_in 'article[title]', with: params[:title]
      fill_in 'article[body]', with: params[:body], visible: false
      find_button(I18n.t('.admin.articles.edit_form.submit'), match: :first).trigger(:click)
    end
    self
  end
end
