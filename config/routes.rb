Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                         sessions: 'users/sessions' }
                                         
  root to: "homes#index"
  resources :users
  resources :photos
  
  get 'after_login_to_post', to: 'users#show'
end
