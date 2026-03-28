Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :registration, only: [ :new, :create ]

  resources :exercises, only: [ :index, :show ]

  resources :routines do
    resources :routine_exercises, only: [ :create, :edit, :update, :destroy ]
  end

  resources :workout_sessions do
    member do
      patch :complete
    end
    resources :workout_sets, only: [ :create, :update ]
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "dashboard#index"
end
