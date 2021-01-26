# frozen_string_literal: true

class ActionController::Parameters

  # https://qiita.com/vochicong/items/d64f3b3d5a448a3b1f42
  # camelCaseのパラメータをsnake_caseに自動変換する
  def deep_snakeize!
    @parameters.deep_transform_keys!(&:underscore)
    self
  end

  # accepts_nested_attributes_for用にパラメータのキーを自動変換する
  def transform_nested_params
    transform_keys! do |key|
      value = self[key]

      if value.is_a? ActionController::Parameters
        "#{key}_attributes"
      elsif value.is_a? Array
        "#{key}_attributes"
      else
        key
      end

    end
  end

end
