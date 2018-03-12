Rails.application.routes.draw do
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
