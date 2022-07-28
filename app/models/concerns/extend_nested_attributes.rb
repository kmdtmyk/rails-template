# frozen_string_literal: true

module ExtendNestedAttributes
  extend ActiveSupport::Concern

  class_methods do

    # accepts_nested_attributes_forにオプションauto_destroyを追加する
    # フォームから送信されなかった子レコードを自動的に削除する
    # input type='hidden' で _destroyを送信する手間を省ける
    def accepts_nested_attributes_for(*attr_names)
      options = attr_names.extract_options!
      auto_destroy = options.delete(:auto_destroy)

      super(*attr_names, options)

      unless auto_destroy
        return
      end

      attr_names.each do |name|

        define_method("#{name}_attributes=") do |attributes|

          if attributes.is_a?(Hash)
            attributes = attributes.map do |index, hash|
              hash
            end
          end

          if self.new_record?
            attributes.each do |attribute|
              attribute.delete(:id)
            end
          end

          if auto_destroy
            destroy_ids = send(name).ids - attributes.pluck(:id).map(&:to_i)
            destroy_attributes = destroy_ids.map do |id|
              { id: id, _destroy: true }
            end

            attributes = attributes + destroy_attributes
          end

          super(attributes)
        end

      end

    end

  end

end
