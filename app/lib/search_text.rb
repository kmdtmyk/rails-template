# frozen_string_literal: true

module SearchText

  def self.normalize(text)
    return if text.nil?
    result = text
    result = result.gsub('う゛', 'ヴ')
    result = result.unicode_normalize(:nfkc).downcase
    result = NKF.nkf('-w -W --katakana', result)
  end

end
