Rails.application.routes.draw do
  namespace :users do
    get 'about/show' => 'about#show'
  end

  resources :user_avatars
  get 'new/show'

  get 'new/edit'

  get 'new/destroy'

  get 'new/index'

  devise_for :users, :controllers => {registrations: 'users/registrations', sessions: 'users/sessions', :omniauth_callbacks => 'users/omniauth_callbacks'}


  namespace :admin do
    resources :categories, :comments, :posts
    resources :users
  end

  resources :categories
  resources :pictures
  resources :comments
  resources :search


  get 'search/search_posts' => 'search#search_post'

  resources :posts do
    resources :comments
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "posts#index"

end