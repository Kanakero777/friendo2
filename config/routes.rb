Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  #d6ebafe3f185ba281860005067fa742a
root to: "tops#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'tops/index' => 'tops#index'
get 'posts/new' => 'posts#new'
post 'posts/new' => 'posts#create'
get 'posts/index' => 'posts#index'
get 'users/show' => 'users#show'
get 'users/search' => 'users#search'
resources :posts do
  resources :comments
end
get 'posts/:id' => 'posts#show'
get 'users/:id' => 'users#detail'
end
