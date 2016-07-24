class AdminsController < ApplicationController
  skip_before_action :require_user
  before_action :require_admin
end
