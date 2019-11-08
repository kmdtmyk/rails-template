# frozen_string_literal: true

class Api::BaseController < ActionController::API
  include JwtAuthenticate

  rescue_from ActiveRecord::RecordNotFound do
    render json: { message: 'Not Found' }, status: 404
  end

  rescue_from ApplicationError::Unauthorized do
    render json: { message: 'Authentication failed' }, status: :unauthorized
  end

  private

    def request_body
      json = JSON.parse(request.body.read)
      if json.is_a? Array
        json.each { |json| json.deep_transform_keys!{ |key| key.underscore.to_sym } }
      else
        json.deep_transform_keys!{ |key| key.underscore.to_sym }
      end
    end

end
