require 'support/base_page'

class Admin::BannersPage < BasePage
  def open
    visit admin_banners_path
    self
  end

  def fill_form(params)
    within 'form' do
      find("label[for='banner_image']").trigger :click
      attach_file('banner[image]', "#{Rails.root}/spec/fixtures/test.jpg", visible: false)
      fill_in 'banner[name]', with: params[:name]
      fill_in 'banner[priority]', with: params[:priority]
      first('#banner_visible').first(:option, 'Yes').select_option
      find_button(I18n.t('.admin.banners.form.submit'), match: :first).trigger(:click)
    end
    self
  end
end
