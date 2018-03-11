class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable, :token_authenticatable

  has_many :authentication_tokens
  has_many :friends
  has_many :catchups, through: :friends
end
