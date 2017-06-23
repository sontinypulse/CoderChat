Rails.application.routes.draw do
  resources :messages
  get 'index' => 'home#index'
  get 'users/check_email' => 'users#check_email'
  get 'users/sign_in' => 'users#sign_in'
  post 'users/authenticate' => 'users#authenticate'
  delete 'log_out' => 'users#log_out'
  resources :users
  root 'home#index'
end
