require 'faker'

FactoryBot.define do
  factory :book do
    title   Faker::Book.title
    author  Faker::Book.author
    pages   Faker::Number.number(3)
    price   Faker::Number.decimal(2)

    factory :available_book do
      status false
    end

    factory :taken_book do
      status true
    end

    factory :invalid_book do
      price nil
    end
  end
end
