require 'faker'

FactoryBot.define do
  factory :review do
    name    Faker::Name.name_with_middle
    summary Faker::Twitter.status[:text]
    book

    factory :best_review do
      stars 5
    end

    factory :average_review do
      stars Faker::Number.between(1, 4)
    end
  end
end