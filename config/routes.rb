Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: "pages#home"

  get 'about', to: "pages#about"

  resources :jobs, only: %i[index new create show edit update destroy] do
    collection do
      get 'created'
    end
    resources :applications, only: [:create, :index]
  end

  resources :bookmarks, only: [:index, :create, :destroy]

  resources :applications, only: [:index, :create, :show]

  resources :users, only: [:show, :update, :edit, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
