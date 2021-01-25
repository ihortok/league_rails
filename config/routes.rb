Rails.application.routes.draw do
  root to: 'leagues#index'
  resources :leagues, only: %i[index show]
  resources :teams, only: %i[index show]
  resources :players, only: %i[index show]
end
