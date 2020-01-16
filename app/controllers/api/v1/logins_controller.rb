# frozen_string_literal: true

class Api::V1::LoginsController < Api::BaseController

  #skip_before_action :authenticate_user!

  def create
    body = request_body
    user = User.find_by(username: body[:username])
    if user.nil? or !user.valid_password?(body[:password])
      raise ApplicationError::Unauthorized
      return
    end
    render json: { user: user, token: user.create_auth_token }
  end

end
