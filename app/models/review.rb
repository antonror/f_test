class Review < ApplicationRecord
  STARS = [1, 2, 3, 4, 5]
  belongs_to :book
  validates :name, :summary, :comment, presence: true
  validates :stars, inclusion: { in: STARS, message: "must be between 1 and 5" }
  validates :comment, length:  { minimum: 15, message: 'should have a bit more than that! (at least 15 characters)' }



  scope :best, ->{ where('stars > 4') }
end
