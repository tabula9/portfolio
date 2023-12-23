Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'password_edit', to: 'users/registrations#password_edit', as: 'password_edit'
    patch 'password_update', to: 'users/registrations#password_update', as: 'password_update'
  end
  resources :users
  get 'novels/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'novels#search'
end
