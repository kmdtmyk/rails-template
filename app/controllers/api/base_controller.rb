# frozen_string_literal: true

class Api::BaseController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do
    render json: { message: 'Not Found' }, status: 404
  end

  rescue_from ApplicationError::Unauthorized do
    render json: { message: 'Authentication failed' }, status: :unauthorized
  end

  private

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

end
