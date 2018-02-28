Rails.application.routes.draw do
  # match 'users/:id' => 'users/show' , via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # resources :relationships
  
  devise_for :users
  resources :users, :only  => [:show , :edit , :update] do
    member do
      get :following , :followers
    end
  end
  root "posts#index"

  
  resources :particulars, :only => [ :show , :edit , :update , :create , :new]
  # resources :posts

  resources :posts do
    post 'like', on: :member, to: 'likes#create'
    delete 'unlike', on: :member, to: 'likes#destroy'
    post 'follow', on: :member, to: 'follows#create'
    delete 'unfollow', on: :member, to: 'follows#destroy'

  end
  resources :likes

  namespace :admin do
    resources :posts
    root "posts#index"
  end
  

end
