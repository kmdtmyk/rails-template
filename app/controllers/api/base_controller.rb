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
      body = JSON.parse(request.body.read)
      if body.is_a? Array
        body.each { |hash| hash.deep_transform_keys!{ |key| key.underscore.to_sym } }
      else
        body.deep_transform_keys!{ |key| key.underscore.to_sym }
      end
    end

end
