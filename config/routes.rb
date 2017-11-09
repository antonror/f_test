Rails.application.routes.draw do
  root 'books#index'

  resources :books do
    collection do
      get 'best_rated'
    end
  end
end
