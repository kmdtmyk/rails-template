# frozen_string_literal: true

module SearchAttribute
  extend ActiveSupport::Concern

  class_methods do

    # 検索用カラムを設定する
    def search_attribute(hash)
      hash.each do |key, value|
        define_method "#{key}=" do |text|
          super(text)
          write_attribute(value, SearchText.normalize(text))
        end
      end
    end

  end

end
