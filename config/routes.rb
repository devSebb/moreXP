Rails.application.routes.draw do
  devise_for :users

  resources :jobs, only: %i[index new create show]
  resources :users, only: %i[show]

  resources :jobs do
    resources :applications, only: [:create]
  end

  resources :applications, only: [] do
    collection do
      get :index
      post :create
    end
  end

  resources :jobs do
    post :add_to_applications, on: :member
    delete :remove_from_applications, on: :member
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"
end
