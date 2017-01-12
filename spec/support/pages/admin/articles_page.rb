require 'support/base_page'

class Admin::ArticlesPage < BasePage
  def open
    visit admin_articles_path
    self
  end

  def fill_form(params, opps={})
    within 'form' do
      find("label[for='article_image']").trigger :click
      attach_file('article[image]', "#{Rails.root}/spec/fixtures/test.jpg", visible: false)
      fill_in 'article[title]', with: params[:title]
      fill_in 'article[body]', with: params[:body], visible: false
      find_button(opps.present? ? I18n.t('.admin.articles.edit_form.submit') : I18n.t('.admin.articles.form.submit'), match: :first).trigger(:click)
    end
    self
  end
end
