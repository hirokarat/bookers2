Rails.application.routes.draw do
  devise_for :users
  get 'homes/about'=>'homes#about',as:'about'
  root to:'homes#top',as:'top'
  resources:books,only:[:new,:create,:index,:show,:edit,:update,:destroy]
  resources :users, only: [:index,:show,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
