# frozen_string_literal: true

module SetSearchText
  extend ActiveSupport::Concern

  # 検索用文字列を設定する
  def set_search_text(hash)
    hash.each do |key, value|
      text = read_attribute(key)
      write_attribute(value, SearchText.normalize(text))
    end
  end

end
