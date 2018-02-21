Rails.application.routes.draw do
  # match 'users/:id' => 'users/show' , via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  devise_for :users
  root "posts#index"

  resources :users, :only  => [:show , :edit , :update]
  resources :particulars, :only => [ :show , :edit , :update , :create , :new]
  # resources :posts

  namespace :admin do
    resources :posts
    root "posts#index"
  end
  

end
