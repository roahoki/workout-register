class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :routines, dependent: :destroy
  has_many :workout_sessions, dependent: :destroy
  has_many :exercises, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }

  generates_token_for :email_verification, expires_in: 24.hours do
    verified_at
  end

  def verified?
    verified_at.present?
  end
end
