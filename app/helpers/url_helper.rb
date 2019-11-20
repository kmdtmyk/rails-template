# frozen_string_literal: true

module UrlHelper

  def sort_url(name)
    query = URI.parse(request.url).query || ''
    hash = URI::decode_www_form(query).to_h.transform_keys(&:to_sym)
    hash.delete :page

    if name.to_s.casecmp? params[:sort]&.to_s
      order = 'asc'.casecmp?(params[:order]&.to_s) ? 'desc' : 'asc'
    else
      order = 'asc'
    end

    url_for(params: hash.merge(sort: name, order: order))
  end

end
