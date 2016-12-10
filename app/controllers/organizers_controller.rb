class OrganizersController < ApplicationController
  before_action :require_organizer
  layout 'organizer_application'
end
