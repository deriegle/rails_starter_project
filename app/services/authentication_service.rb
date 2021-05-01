class AuthenticationService
  def self.authenticate_user(email, password)
    return unless email && password

    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
  end

  def self.generate_token(user_id)
    JwtService.encode(:user_id => user_id)
  end

  def self.user_if_authorized(headers)
    token = headers&.fetch("Authorization", nil)
    return unless token.present?

    decoded_token = JwtService.decode(token)
    return unless decoded_token

    User.find_by(:id => decoded_token[:user_id])
  end
end
