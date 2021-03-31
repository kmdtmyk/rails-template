# frozen_string_literal: true

class User < ApplicationRecord
  include ExtendOrder
  include SearchCop
  include SetSearchText

  devise(
    :database_authenticatable,
    :registerable,
    # :recoverable,
    :rememberable,
    :validatable,
    # :confirmable,
    # :lockable,
    # :timeoutable,
    :trackable,
    # :omniauthable,
  )

  validates :email, uniqueness: true, allow_nil: true
  validates :username, uniqueness: true, allow_nil: true

  acts_as_rparam_user

  before_save do

    set_search_text(
      name: :search_name,
      furigana: :search_furigana,
    )

    if encrypted_password_changed?
      self.password_change_datetime = Time.current
      if jti.present?
        self.jti = SecureRandom.uuid
      end
    end

  end

  search_scope :keyword_search do
    attributes :username, :search_name, :search_furigana
  end

  scope :search, ->(params){
    result = self

    if params[:q].present?
      result = result.keyword_search(SearchText.normalize(params[:q]))
    end

    result
  }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def create_auth_token
    if jti.nil?
      update(jti: SecureRandom.uuid)
    end
    payload = {
      user_id: id,
      iat: Time.current.to_i,
      exp: 30.days.from_now.to_i,
      jti: jti,
    }
    JWT.encode(payload, ENV['SECRET_KEY_BASE'])
  end

end
