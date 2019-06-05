Rails.application.routes.draw do
  resources :photos
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks',registrations: 'users/registrations'}
  #d6ebafe3f185ba281860005067fa742a
root to: "tops#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'tops/index' => 'tops#index'
get 'posts/new' => 'posts#new'
post 'posts/new' => 'posts#create'
get 'posts/index' => 'posts#index'
get 'users/search' => 'users#search'
get 'lookups' => 'lookups#index'
post 'lookups' => 'lookups#index'
resources :posts do
  resources :comments
end
resources :profiles, only: [:create,:update]
get 'posts/:id' => 'posts#show'
get 'users/:id' => 'users#show'

resources :users do
    member do
     get :following, :followers
    end
  end

resources :relationships, only: [:create, :destroy]
end
