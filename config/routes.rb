Rails.application.routes.draw do
  devise_for :users, skip: :all
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
    post 'signup', to: 'users/registrations#create'
    get 'setting/profile', to: 'users/registrations#edit'
    patch 'setting/profile', to: 'users/registrations#update'
    delete 'delete', to: 'users/registrations#destroy'
    get 'login', to: 'users/sessions#new'
    post 'login', to: 'users/sessions#create'
    delete 'logout', to: 'users/sessions#destroy'
    get 'forgot_password', to: 'users/passwords#new'
    post 'forgot_password', to: 'users/passwords#create'
    get 'password_reset', to: 'users/passwords#edit'
    put 'password_reset', to: 'users/passwords#update'
  end

  get 'search', to: 'pages#search'

  get 'setting/password', to: 'users#edit'
  patch 'setting/password', to: 'users#update_password'
  get 'about', to: 'pages#about'

  resources :users, only: :show do
    resources :favorites, only: [:index, :create, :destroy]
    member do
      get :following, :followers
    end
  end
  
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end

  resources :comments, only: [:create, :edit, :update, :destroy] do
    member do
      get :cancel
    end
  end

  resources :relationships, only: [:create, :destroy]

  root 'pages#home'
end
