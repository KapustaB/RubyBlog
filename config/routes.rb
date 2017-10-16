Rails.application.routes.draw do
  namespace :admin do
    get 'sessions/new'
  end

  namespace :admin do
    get 'sessions/create'
  end

  namespace :admin do
    get 'users/new'
  end

  namespace :admin do
    get 'users/create'
  end

  namespace :admin do
    get 'users/edit'
  end

  namespace :admin do
    get 'users/update'
  end

  namespace :admin do
    get 'users/destory'
  end

  namespace :admin do
    get 'users/show'
  end

  namespace :admin do
    get 'users/index'
  end

  namespace :admin do
    get 'posts/new'
  end

  namespace :admin do
    get 'posts/create'
  end

  namespace :admin do
    get 'posts/edit'
  end

  namespace :admin do
    get 'posts/update'
  end

  namespace :admin do
    get 'posts/destroy'
  end

  namespace :admin do
    get 'posts/index'
  end

  namespace :admin do
    get 'posts/show'
  end

  namespace :admin do
    get 'categories/new'
  end

  namespace :admin do
    get 'categories/edit'
  end

  namespace :admin do
    get 'categories/update'
  end

  namespace :admin do
    get 'categories/destroy'
  end

  namespace :admin do
    get 'categories/show'
  end

  namespace :admin do
    get 'categories/index'
  end

  namespace :admin do
    resources :categories, :comments, :posts, :users
  end

  resources :categories
  resources :pictures
  resources :comments

  resources :posts do
    resources :comments
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  get 'search', to: 'search#search'

  devise_for :users, :controllers => {registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "posts#index"


end