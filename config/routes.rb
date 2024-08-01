Rails.application.routes.draw do
  devise_for :users

  resources :jobs, only: %i[index new create show] do
    resources :applications, only: [:create, :index]
  end

  resources :bookmarks, only: [:index, :create] do
    delete 'remove/:job_id', to: 'bookmarks#destroy', as: :remove
  end


  resources :users, only: [:show, :update, :edit]

  resources :applications, only: [:index, :create, :show]

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"
end
