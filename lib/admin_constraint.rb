class AdminConstraint
  def matches?(request)
    return false unless request.session[:admin]
    request.session[:admin]
  end
end
