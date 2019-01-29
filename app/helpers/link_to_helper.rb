# frozen_string_literal: true

module LinkToHelper

  def new_link_to(name, url, options = nil)
    option ||= {}
    default_option = {
      class: '',
    }
    options = default_option.merge(option)
    link_to name, url, options
  end

  def edit_link_to(name, url, options = nil)
    option ||= {}
    default_option = {
      class: '',
    }
    options = default_option.merge(option)
    link_to name, url, options
  end

  def delete_link_to(name, url, option = nil)
    option ||= {}
    default_option = {
      # class: 'btn btn-danger btn-sm',
      method: :delete,
      data: { title: '確認',
        confirm: '選択した項目を削除しますか？',
        # 'commit-class': 'btn-danger',
      },
    }
    options = default_option.merge(option)
    link_to name, url, options
  end

end