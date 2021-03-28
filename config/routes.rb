Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
      }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :tweets do
    resources :likes
  end
  get 'search', to: 'tweets#search'
  post 'friends/:friend_id', to: 'friends#create'
  root to: "tweets#index"
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
