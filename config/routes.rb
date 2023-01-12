Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :show]
  namespace :admin do
    resources :posts
  end
  resources :tags
  resources :uploads, only: [:create, :destroy]
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    root :to => "users/sessions#new"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end
  
  devise_scope :admin do
    root :to => "admin/posts#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
