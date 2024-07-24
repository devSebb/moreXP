Rails.application.routes.draw do
  devise_for :users

  resources :jobs, only: %i[index new create show]
  resources :users, only: %i[show]

  resources :applications, only: [] do
    collection do
      get :index
      post :create
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"
end
