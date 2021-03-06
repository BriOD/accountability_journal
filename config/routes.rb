Rails.application.routes.draw do



  get 'static/welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # user login and registration
  root 'static#welcome'



  resources :users, only: [:show]
  resources :daily_activities, only: [:new, :create, :show]

  resources :journals, only: [:new, :create, :show, :index] do
    resources :entries, only: [:new, :create, :show, :index], shallow: true do
      resources :activity_accounts, only: [:new, :create]
    end
  end

  get '/entries/:id/next', to: "entries#next", as: 'entry_next'

  get '/signup', to: "users#signup", as: 'user_signup'
  post '/users', to: "users#create", as: 'create_user'
  get '/login', to: "sessions#login", as: 'login'
  post '/login', to: "sessions#create", as: "create_session"
  get '/logout', to: "sessions#destroy", as: "logout"
end
