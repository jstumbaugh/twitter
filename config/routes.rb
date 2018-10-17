Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Users
      post "user/token" => "user_token#create"
      get "users/current" => "users#current"

      resources :tweets
    end
  end

  root "home#index"
end
