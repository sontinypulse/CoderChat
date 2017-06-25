Rails.application.routes.draw do
  get 'messages/sent' => 'messages#sent_messages'
  get 'messages/view_sent' => 'messages#view_sent'
  resources :messages
  get 'index' => 'home#index'
  get 'users/check_email' => 'users#check_email'
  get 'users/sign_in' => 'users#sign_in'
  post 'users/authenticate' => 'users#authenticate'
  delete 'log_out' => 'users#log_out'
  resources :users
  root 'home#index'
  get 'friends/list' => 'friends#list'
  post 'friends/add' => 'friends#add'
  post 'friends/accept' => 'friends#accept'
  get 'friends/myfriends' => 'friends#my_friends'
end
