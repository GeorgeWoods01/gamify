Rails.application.routes.draw do
  devise_for :users
  root to: 'classrooms#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :missions, only: %i[edit update destroy] do
    resources :mission_setups, only: %i[create index update]
  end

  resources :classrooms, only: [:show] do
    resources :students, only: %i[index new create]
    resources :missions, only: %i[new create index]
  end

  resources :mission_setups do
    collection do
      match "update_collection", via: %i[put patch]
    end
  end

  resources :students, only: %i[show update]
  resources :rewards, only: %i[index show new create destroy] do
    resources :reward_transactions, only: %i[new create show index]
  end
end
