class Review < ApplicationRecord
  belongs_to :book

  scope :best, ->{ where('stars > 4') }
end
