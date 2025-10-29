class User < ApplicationRecord
  # Criptografia nativa do Rails para dados sensíveis
  encrypts :name
  encrypts :email
  encrypts :birthdate

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :birthdate, presence: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_one :cart
end