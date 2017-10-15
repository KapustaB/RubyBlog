Rails.application.routes.draw do
  resources :categories
  resources :pictures
  resources :authors
  resources :comments

  resources :posts do
    resources :comments
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end


  devise_for :users, :controllers => {registrations: 'users/registrations', sessions: 'users/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "posts#index"


end