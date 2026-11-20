class User < ApplicationRecord
  has_secure_password

  has_many :support_requests, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, presence: true
  validates :role, presence: true,
                   inclusion: { in: %w[resident staff] }
end