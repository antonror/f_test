class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, :author, :pages, :price, presence: true
  validates :pages, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  scope :by, ->(author) { where('author = ?', author) }
  scope :best_rated, -> { joins(:reviews).merge(Review.best) }
end
