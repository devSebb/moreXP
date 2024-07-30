Rails.application.routes.draw do
  devise_for :users

  resources :jobs, only: %i[index new create show] do
    resources :applications, only: [:create]
    post :add_to_applications, on: :member
    delete :remove_from_applications, on: :member
  end

  resources :users, only: [:show]

  resources :applications, only: [:index, :create, :show]

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"
end
