class Book < ApplicationRecord
  has_many          :reviews,     dependent: :destroy
  has_many          :movements,   dependent: :destroy
  has_attached_file :image,       styles:   { small: "64x64",
                                              med: "100x100",
                                              large: "200x200"}

  validates :title, :author, :pages, :price, presence: true
  validates :pages, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  do_not_validate_attachment_file_type :image

  scope :by, ->(author) { where('author = ?', author) }
  scope :best_rated, -> { joins(:reviews).merge(Review.best) }

  def average_stars
    reviews.average(:stars)
  end

  def recent_reviews(recent_count = 2)
    reviews.order('created_at desc').limit(recent_count)
  end
end
