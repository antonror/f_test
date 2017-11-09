Rails.application.routes.draw do
  root 'books#index'

  resources :books do
    get 'page/:page', :action => :index, :on => :collection
    collection do
      get 'best_rated'
      get 'best_rated/page/:page', :action => :best_rated
    end
  end
end
