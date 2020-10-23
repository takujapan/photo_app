Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                         sessions: 'users/sessions' }
                                         
  root to: "homes#index"
  resources :users
  resources :photos do
    resource :likes, only: [:create, :destroy]
  end
  get 'after_login_to_post', to: 'users#show'
end
