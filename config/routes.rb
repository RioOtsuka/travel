Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'hello/index' => 'hello#index'
 
  root 'hello#index'
  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :maps
    resources :comments, only: [:create]
  end
 

end
