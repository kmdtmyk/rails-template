# frozen_string_literal: true

class CsvGenerator::Base

  DEFAULT_ENCODING = Encoding::UTF_8
  # DEFAULT_ENCODING = Encoding::SJIS

  def self.generate(records, encoding: DEFAULT_ENCODING, force_quotes: true, &block)
    new(records).generate(encoding: encoding, force_quotes: force_quotes, &block)
  end

  def initialize(records)
    @ids = records.ids
  end

  def generate(encoding: DEFAULT_ENCODING, force_quotes: true, &block)

    unless block_given?
      result = ''
    end

    if respond_to?(:headers)
      csv = CSV.generate(write_headers: true, force_quotes: force_quotes, encoding: encoding) do |csv|
        csv << headers
      end

      if block_given?
        yield csv
      else
        result += csv
      end
    end

    @ids.each_slice(500) do |ids|
      csv = CSV.generate(write_headers: false, force_quotes: force_quotes, encoding: encoding) do |csv|
        ids_to_a(ids).each do |row|
          csv << if encoding == Encoding::UTF_8
            row
          else
            row.map do |value|
              if value.class == String
                # 互換性のない文字を変換する
                value.encode(encoding, undef: :replace)
              else
                value
              end
            end
          end
        end
      end

      if block_given?
        yield csv
      else
        result += csv
      end
    end

    unless block_given?
      result
    end
  end

  # idsをcsvの配列に変換して返す
  # サブクラスでの実装が必要
  def ids_to_a(ids)
    raise "#{self.class} に #{__method__} の実装が必要です"
  end

end
