Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get '/top' => 'books#top'

  get '/about' => 'books#about'

  # get '/user' => 'users#mypage'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#top'
  resources :books
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users, only: [:show, :edit, :mypage, :update, :index]

end
