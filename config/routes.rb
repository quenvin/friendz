Rails.application.routes.draw do
  # match 'users/:id' => 'users/show' , via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  devise_for :users
  root "posts#index"

  resources :users, :only  => [:show , :edit , :update]
<<<<<<< HEAD
  resources :particulars, :only => [ :show , :edit , :update , :create , :new]
  # resources :posts
=======
  resources :posts do
    post 'like', on: :member, to: 'likes#create'
    delete 'unlike', on: :member, to: 'likes#destroy'
  end
  resources :likes
>>>>>>> 20b4170ee0480936f7a656d88562be464c80a774

  namespace :admin do
    resources :posts
    root "posts#index"
  end
  

end
