Rails.application.routes.draw do
  devise_for :users

  root "root#index"

  resources :organizations, only: %i[show] do
    resources :users, only: %i[index], module: :organizations
    resources :subjects, only: %i[index new create edit update destroy], module: :organizations
    resources :field_of_studies, only: %i[index new create edit update destroy], module: :organizations
    resources :teacher_specializations, only: %i[index], module: :organizations
  end
end
