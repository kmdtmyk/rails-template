# frozen_string_literal: true

module ApplicationHelper

  def hidden_referrer
    if params[:referrer].nil?
      value = request.referrer
    else
      value = params[:referrer]
    end
    hidden_field_tag 'referrer', value, id: nil
  end

end
