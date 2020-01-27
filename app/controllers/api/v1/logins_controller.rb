# frozen_string_literal: true

class Api::V1::LoginsController < Api::BaseController

  #skip_before_action :authenticate_user!

  def create
    user = User.find_by(username: params[:username])
    if user.nil? or !user.valid_password?(params[:password])
      raise ApplicationError::Unauthorized
      return
    end
    render json: { user: user, token: user.create_auth_token }
  end

end
