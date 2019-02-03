Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'
  
  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
    post 'signup', to: 'users/registrations#create'
    get 'setting/profile', to: 'users/registrations#edit'
    patch 'edit/profile', to: 'users/registrations#update'
    get 'login', to: 'users/sessions#new'
    post 'login', to: 'users/sessions#create'
    delete 'logout', to: 'users/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
