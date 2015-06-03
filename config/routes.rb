Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'visitors#index'
    end
    unauthenticated do
      root 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end

  resources :topics do
    resources :events
  end

  get 'learning', to: 'learning#index', as: 'learning_all'
  get 'learning/:id', to: 'learning#show', as: :learning

  get 'tests', to: 'tests#index', as: :tests
  get 'tests/:id', to: 'tests#show', as: :test
  post 'tests/:id/submit', to: 'answers#submit', as: :answer
end
