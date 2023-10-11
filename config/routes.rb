Rails.application.routes.draw do
  root "menus#index"
  namespace :api do
    namespace :v1 do
      resources :menus do
        collection do
          get 'sort'
        end
      end
    end
  end

end
