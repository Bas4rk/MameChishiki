Rails.application.routes.draw do
  get 'static_pages/home'
  root 'static_pages#home'
  devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }
  resources  :users, :only => [:show,:index,:edit,:update] do
    resources :likes, :only => [:index]
    member do
      get :following, :followers
    end
  end
  resources :posts, :only => [:show,:new,:create,:destroy] do
    resources :comments, :only =>  [:create,:destroy]
    resources :likes, :only => [:show]
  end
  resources :likes, only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
 # get '/users/:id' => 'users#show'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
