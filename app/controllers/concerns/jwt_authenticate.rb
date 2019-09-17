# frozen_string_literal: true

module JwtAuthenticate
  extend ActiveSupport::Concern

  def authenticate_user!
    if current_user.nil?
      raise ApplicationError::Unauthorized
    end
  end

  def current_user
    if auth_token.nil?
      return
    end

    user = User.find(auth_token[:user_id])

    if auth_token[:jti] == user.jti
      user
    end
  rescue
    nil
  end

  def auth_token
    if request.headers['Authorization'].start_with? 'Bearer '
      token = request.headers['Authorization'][7..-1]
    end
    HashWithIndifferentAccess.new JWT.decode(token, ENV['SECRET_KEY_BASE'], true)[0]
  rescue
    nil
  end

  def create_auth_token(user)
    if user.jti.nil?
      user.update(jti: SecureRandom.uuid)
    end
    payload = {
      user_id: user.id,
      iat: Time.current.to_i,
      exp: 30.days.from_now.to_i,
      jti: user.jti,
    }
    JWT.encode(payload, ENV['SECRET_KEY_BASE'])
  end

end
