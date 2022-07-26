# frozen_string_literal: true

module ApplicationCable
  class Channel < ActionCable::Channel::Base

    def self.broadcast_to(model, message)
      if message.class == Hash
        # js側ではlowerCamelCaseで取り扱いたいので自動で変換されるようにする
        message = message.transform_keys{ _1.to_s.camelize(:lower) }
      end

      super(model, message)
    end

  end
end
