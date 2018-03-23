Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :authentication_tokens
    resources :catchups
    resources :friends

    root to: "users#index"
  end

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :friends do
    resources :catchups
  end

  get '/about' => 'home#about'
  root to: "home#index"
end
