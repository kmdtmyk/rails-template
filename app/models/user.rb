# frozen_string_literal: true

class User < ApplicationRecord

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

  before_save do
    if jti.present? and encrypted_password_changed?
      self.jti = SecureRandom.uuid
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
