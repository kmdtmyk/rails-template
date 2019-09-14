# frozen_string_literal: true

class Api::BaseController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do
    render json: { message: 'Not Found' }, status: 404
  end

end
