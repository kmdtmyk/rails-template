# frozen_string_literal: true

module FontAwesome5Helper

  def fa_icon(style, name, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    if name.is_a? String
      name = name.split(' ')
    end

    if name.is_a? Array
      name = name.map{|n| "fa-#{n}"}.join(' ')
    end

    content_class = "#{style} #{name}"
    if html_options.key?(:class)
      content_class = content_class + " #{html_options[:class]}"
    end
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << ' ' << text.to_s unless text.blank?
    html
  end

  def far(*args)
    fa_icon('far', *args)
  end

  def fas(*args)
    fa_icon('fas', *args)
  end

end
