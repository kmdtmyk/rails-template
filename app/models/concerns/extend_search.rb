# frozen_string_literal: true

module ExtendSearch
  extend ActiveSupport::Concern

  included do

    # 日付の範囲検索
    scope :from_to_date_search, ->(attribute, from, to){
      result = self

      from_date = from&.to_date rescue nil
      to_date = to&.to_date rescue nil

      if from_date.present?
        result = result.where("? <= \"#{model.table_name}\".\"#{attribute}\"", from_date)
      end

      if to_date.present?
        result = result.where("\"#{model.table_name}\".\"#{attribute}\" < ?", to_date + 1)
      end

      result
    }

    # 部分一致検索
    scope :partial_match_search, ->(attribute, text){
      result = self

      if text.nil?
        return result
      end

      text.scan(/[^[:blank:]]+/).each do |word|
        result = result.where("\"#{model.table_name}\".\"#{attribute}\" ILIKE ?", "%#{sanitize_sql_like(word)}%")
      end

      result
    }

    # 前方一致検索
    scope :prefix_search, ->(attribute, text){
      if text.nil? || text.blank?
        return
      end

      where("\"#{model.table_name}\".\"#{attribute}\" ILIKE ?", "#{sanitize_sql_like(text.strip)}%")
    }

  end

end





