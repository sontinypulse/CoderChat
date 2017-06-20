Rails.application.routes.draw do
  get 'index' => 'home#index'
  resources :users
  root 'home#index'
end
