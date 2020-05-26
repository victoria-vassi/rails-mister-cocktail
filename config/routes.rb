Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  resources :cocktails, only: [:index, :show, :new, :edit, :update, :create, :destroy] do
    resources :doses, only: [ :new, :create, :edit]
  end

  resources :doses, only: [:destroy]
end
