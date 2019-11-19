# frozen_string_literal: true

class User < ApplicationRecord
  include SearchCop
  include ExtendOrder

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
    if jti.present? and encrypted_password_changed?
      self.jti = SecureRandom.uuid
    end
  end

  search_scope :search_scope do
    attributes :username, :name, :furigana
  end

  scope :search, -> (params) {
    result = self

    if params[:q].present?
      result = search_scope(params[:q])
    end

    result
  }

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
