Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :show, :new, :edit, :update, :create, :destroy] do
    resources :doses, only: [ :new, :create ]
  end

  resources :doses, only: [:destroy, :edit]
end