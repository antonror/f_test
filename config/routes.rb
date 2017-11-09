Rails.application.routes.draw do
  root 'books#index'

  resources :books do
    collection do
      get 'page/:page', :action => :index
      get 'best_rated'
      get 'best_rated/page/:page', :action => :bargains
    end
    resources :reviews
  end
end
