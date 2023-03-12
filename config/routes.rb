Rails.application.routes.draw do
  devise_for :users

  root "root#index"

  resources :companies, only: %i[show] do
    resources :users, only: %i[index], module: :companies
  end
end
