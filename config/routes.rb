Rails.application.routes.draw do
  root "menus#index"
  namespace :api do
    namespace :v1 do
      resources :menus
    end
  end
end
