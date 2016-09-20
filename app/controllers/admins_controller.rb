class AdminsController < ApplicationController
  layout 'admin_layout'

  skip_before_action :require_user if Rails.env.development? || Rails.env.test?
  before_action :require_admin
end
