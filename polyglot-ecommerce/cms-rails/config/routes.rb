Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments, only: [:index, :create, :destroy]
      end
      resources :authors
      resources :categories
    end
  end
end