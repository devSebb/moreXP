Rails.application.routes.draw do
  devise_for :users
  # , controllers: { registrations: 'users/registrations' }

  resources :jobs, only: %i[index new show]


  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "pages#home"
end
