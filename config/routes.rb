Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "menus#index"
  resources :menus do
    collection do
      get 'sort'
      get 'search'
    end
  end
end
