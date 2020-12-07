Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                         sessions: 'users/sessions' }
                                         
  root to: "homes#index"
  resources :users do
    resource  :follow
    resources :followings
    resources :followers
  end
  resources :photos do
    resource :likes, only: [:create, :destroy]
    resources :comments
    
  end
  get 'after_login_to_post', to: 'users#show'
end
