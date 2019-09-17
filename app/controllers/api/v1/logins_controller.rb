
# frozen_string_literal: true

class Api::V1::LoginsController < Api::BaseController

  def create
    user = User.find_by(username: params[:username])
    if user.nil? or !user.valid_password?(params[:password])
      raise ApplicationError::Unauthorized
      return
    end
    render json: { user: user, token: token(user) }
  end

  private

    def token(user)
      payload = {
        user_id: user.id,
        iat: Time.current.to_i,
        exp: 30.days.from_now.to_i,
      }
      JWT.encode(payload, ENV['SECRET_KEY_BASE'])
    end

end
