# frozen_string_literal: true

class Api::V1::BaseController < ActionController::API
  include JwtAuthenticate

  #before_action :authenticate_user!

  before_action do
    params.deep_snakeize!
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: { message: 'Not Found' }, status: 404
  end

  rescue_from ApplicationError::Unauthorized do
    render json: { message: 'Authentication failed' }, status: :unauthorized
  end

  rescue_from ActionController::ParameterMissing do |e|
    render json: { message: e }, status: 400
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

    def transform_nested_attributes(attributes)
      if attributes.is_a? Array
        attributes = attributes.map do |attributes|
          transform_nested_attributes(attributes)
        end
      else
        attributes = attributes.transform_keys do |key|
          if attributes[key].is_a? Array and !key.to_s.end_with?('ids')
            "#{key}_attributes"
          else
            key
          end
        end
      end

      attributes
    end

end
