class JwtService
  def self.encode(payload, expiration: 24.hours.from_now)
    clone = payload.clone
    clone[:exp] = expiration.to_i
    JWT.encode(clone, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    body = JWT.decode(token, Rails.application.secrets.secret_key_base).first
    HashWithIndifferentAccess.new(body)
  rescue
    nil
  end
end
