Rails.application.routes.draw do
  get 'novels/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'novels#search'
end
