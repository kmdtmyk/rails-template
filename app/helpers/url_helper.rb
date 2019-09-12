# frozen_string_literal: true

module UrlHelper

  def sort_url(name)
    hash = params.to_unsafe_h.reject do |key|
      %w(action controller).include? key
    end

    if params[:sort]&.to_sym == name.to_sym
      order = params[:order] == 'asc' ? 'desc' : 'asc'
    else
      order = 'asc'
    end

    url_for(params: hash.merge(sort: name, order: order))
  end

end
