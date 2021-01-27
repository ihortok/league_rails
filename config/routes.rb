Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'leagues#index'
  resources :leagues, only: %i[index show]
  resources :teams, only: %i[index show]
  resources :players, only: %i[index show]
end
