Rails.application.routes.draw do
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get 'homes', to: 'home#index'
  namespace :administrator do
    resources :aquaria
  end
  resources :aquaria, onyl: %i[index show]
  resources :users, only: %i[new create show]
end
