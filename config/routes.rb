Rails.application.routes.draw do
  get 'static_pages/home'
  root 'static_pages#home'
  devise_for :users, :controllers => {
 :registrations => 'users/registrations'
}
  resources  :users, :only => [:show,:index]
  resources :posts, :except => [:index]
 # get '/users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
