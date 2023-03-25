Rails.application.routes.draw do
  devise_for :users

  root "root#index"

  resources :organizations, only: %i[show] do
    resources :users, only: %i[index], module: :organizations
  end
end
