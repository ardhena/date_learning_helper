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

  resources :topics

end
