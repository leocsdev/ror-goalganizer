Rails.application.routes.draw do
  # get 'home/index'
  # get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  get 'about', to: 'home#about'

  resources :goals, :tasks
end
