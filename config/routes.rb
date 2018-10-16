Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :create] do
        post "/shots", to: "games/shots#create"
      end

      resources :users, only: [:index, :show, :update]
    end
  end

  resources :users, only: [:show, :index, :edit, :update, :new, :create]

  root "welcome#index"
  get "/dashboard", to: "welcome#show"
  get "/register", to: "users#new"
  get "/activate/:id", to: "account_activations#show"
end
