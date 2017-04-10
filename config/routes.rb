Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # user login and registration
  root 'session#login'

  get '/signup', to: "users#signup", as: 'user_signup'
  post '/users', to: "users#create", as: 'create_user'
  get '/login', to: "sessions#new", as: 'login'
  post '/login', to: "sessions#create", as: "create_session"
  delete '/logout', to: "sessions#destroy", as: "logout"
end
