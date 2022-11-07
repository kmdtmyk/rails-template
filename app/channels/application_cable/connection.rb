# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # 通常のcontroller側と同様に、current_userでログインユーザを取得できるようにする
      self.current_user = find_verified_user
    end

    protected

      def find_verified_user
        User.find(env['warden'].user.id)
      rescue
        reject_unauthorized_connection
      end

  end
end
