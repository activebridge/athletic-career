module SessionMethods
  def client_uid(provider)
    auth_hash[:uid]
  end

  def client_token(provider)
    auth_hash[:credentials][:token]
  end

  def client_username(provider)
    auth_hash[:info][:name]
  end
end
