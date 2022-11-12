class Restaurant < ApplicationRecord
  CATEGORIES = %w[chinese italian japanese french belgian]

  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  validates :category, inclusion: {
    in: CATEGORIES,
    message: '%{<value>} is not a valid category'
  }
end
