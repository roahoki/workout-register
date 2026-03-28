Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :registration, only: [ :new, :create ]

  resources :exercises

  get  "check-email",          to: "email_verifications#check",  as: :check_email
  get  "verify-email/:token",  to: "email_verifications#verify",  as: :verify_email
  post "resend-verification",  to: "email_verifications#resend",  as: :resend_verification

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
