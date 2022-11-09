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

  def date_field_tag(*args)
    args[2] ||= {}
    args[2][:max] = '9999-12-31'
    super
  end

end
