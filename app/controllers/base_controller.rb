# frozen_string_literal: true

class BaseController < ApplicationController
  helper FontAwesome5Helper
  helper FormatHelper
  helper LinkToHelper
  helper PaginationHelper
  helper Theme::Bootstrap4Helper

  private

    def redirect_to_back(response_status = {})
      redirect_back fallback_location: root_path, **response_status
    end

    def redirect_to_params_referrer_or(options = {}, response_status = {})
      if params[:referrer].present?
        redirect_to params[:referrer], response_status
      else
        redirect_to options, response_status
      end
    end

end
