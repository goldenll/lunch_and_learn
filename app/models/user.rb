class User < ApplicationRecord
  before_create :generate_api_key

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :api_key, uniqueness: true

  has_secure_password
  has_many :favorites

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(27)
  end
end