Rails.application.routes.draw do
  namespace :api do  
    namespace :v1 do
      resources :fizz_buzz, only: [:index, :create]
      resources :favourites, only: [:index, :create, :destroy]
    end
  end 
end