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

    if name.to_s == params[:sort].to_s
      name = "-#{name}"
    end

    url_for(params: query_hash.merge(sort: name))
  end

end
