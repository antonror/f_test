Rails.application.routes.draw do
  get "/books" => "books#index"
  get "/books/:id" => "books#show", as: 'book'
end
