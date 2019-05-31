Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources  :users, :only => [:show,:index]
  resources :posts, :except => [:index]
 # get '/users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
