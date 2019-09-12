# frozen_string_literal: true

module LinkToHelper

  def new_link_to(name, url, options = nil)
    option ||= {}
    default_option = {
      class: 'btn btn-primary',
    }
    options = default_option.merge(option)
    link_to name, url, options
  end

  def edit_link_to(name, url, options = nil)
    option ||= {}
    default_option = {
      class: 'btn btn-primary',
    }
    options = default_option.merge(option)
    link_to name, url, options
  end

  def delete_link_to(name, url, option = nil)
    option ||= {}
    default_option = {
      class: 'btn btn-danger',
      method: :delete,
      data: { title: '確認',
        confirm: '選択した項目を削除しますか？',
        # 'commit-class': 'btn-danger',
      },
    }
    options = default_option.merge(option)
    link_to name, url, options
  end

  def download_link_to(url, options = nil)
    option ||= {}
    default_option = {
      class: 'btn btn-info'
    }
    options = default_option.merge(option)
    link_to url, options do
      yield
    end
  end

  def sort_link_to(name, options = nil, &block)
    options ||= {}

    if name.to_s.casecmp? params[:sort]&.to_s
      if 'asc'.casecmp? params[:order]&.to_s
        icon = fas('sort-up')
      elsif 'desc'.casecmp? params[:order]&.to_s
        icon = fas('sort-down')
      end
    end

    link_to sort_url(name), options do
      capture(&block) + icon
    end
  end

end
