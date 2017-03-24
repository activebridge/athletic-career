require 'support/base_page'

class ProfilePage < BasePage
  def initialize(path)
    @path = path
  end

  def open
    visit @path
    self
  end
end
