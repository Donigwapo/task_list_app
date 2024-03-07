Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


  root 'api/v1/index#index'
 
  
  namespace :api do
    namespace :v1 do
      resources :tasklist, param: :id, format: :json
      resources :category, param: :id, format: :json, only: [:index, :show, :create, :update, :destroy] do
        collection do
          get :users
        end
        
        member do
          get 'users/:user_id', to: 'category#users_category'
         
        end
      end
      resources :users, only: [:index, :show, :destroy]
      post 'sign_up', to: 'registrations#create' # Custom sign-up route
      post 'sign_in', to: 'sessions#create'      # Custom sign-in route
      get 'me', to: 'users#show'                  # Custom current user route
      get 'users/:id', to: 'users#destroy'
     
    end
  end 
  #  get '*path', to: 'pages#index', via: :all
 
end
