class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :token_authenticatable
  devise :pwned_password unless Rails.env.test?

  has_many :authentication_tokens, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :catchups, through: :friends
end
