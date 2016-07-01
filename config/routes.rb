Rails.application.routes.draw do
  namespace :api do  
    namespace :v1 do
      resources :fizz_buzz, only: :index
    end
  end 
end