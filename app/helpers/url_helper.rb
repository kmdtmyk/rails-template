# frozen_string_literal: true

module UrlHelper

  def sort_url(name)
    query = URI.parse(request.url).query || ''

    query_hash = {}

    URI.decode_www_form(query).each do |name, value|
      if name.end_with?('[]')
        name = name.delete_suffix('[]')
        query_hash[name] ||= []
        query_hash[name] << value
      else
        query_hash[name] = value
      end
    end

    query_hash = query_hash.transform_keys(&:to_sym)

    query_hash.delete :page

    if name.to_s.casecmp? params[:sort]&.to_s
      order = 'asc'.casecmp?(params[:order]&.to_s) ? 'desc' : 'asc'
    else
      order = 'asc'
    end

    url_for(params: query_hash.merge(sort: name, order: order))
  end

end
