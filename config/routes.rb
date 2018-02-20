Rails.application.routes.draw do
  
  
  devise_for :users
  # match 'users/:id' => 'users/show' , via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "posts#index"
  resources :users, :only  => [:show , :edit , :update]
  resources :posts
  

end
