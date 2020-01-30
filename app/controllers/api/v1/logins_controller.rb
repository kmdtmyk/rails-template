# frozen_string_literal: true

class Api::V1::LoginsController < Api::BaseController

  #skip_before_action :authenticate_user!

  def create
    user = User.find_by(username: params[:username])
    if user.nil? or !user.valid_password?(params[:password])
      raise ApplicationError::Unauthorized
    end

    render json:{
      user: ActiveModelSerializers::SerializableResource.new(
        user, serializer: Api::V1::UserSerializer
      ),
      token: user.create_auth_token,
    }
  end

end
