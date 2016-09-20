class AdminsController < ApplicationController
  layout 'admin_layout'

  skip_before_action :require_user
  before_action :require_admin
end
