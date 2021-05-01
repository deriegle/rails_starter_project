class JwtService
  def self.encode(payload, expiration: 24.hours.from_now)
    clone = payload.clone
    clone[:exp] = expiration.to_i
    JWT.encode(clone, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
    payload.with_indifferent_access
  rescue
    nil
  end
end
