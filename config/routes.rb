Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => "homes#about"
  devise_for :users
  resources :books, only: [:new, :create, :index, :show]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSLa available within this file, see https://guides.rubyonrails.org/routing.html
end
