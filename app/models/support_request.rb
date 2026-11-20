class SupportRequest < ApplicationRecord
  belongs_to :user

  CATEGORIES = %w[
    食料
    水
    生活用品
    医療・健康
    その他
  ].freeze

  validates :title, presence: true
  validates :category, presence: true,
                       inclusion: { in: CATEGORIES }
  validates :description, presence: true
  validates :address, presence: true
  validates :status, presence: true
end