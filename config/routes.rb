Rails.application.routes.draw do
  root 'users#index'
  get 'pages/index'
  get 'pages/show'
  devise_for :users
  get '/pages' => 'pages#index'
  resources  :users, :only => [:show,:index]
 # get '/users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
