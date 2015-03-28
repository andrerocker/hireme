Rails.application.routes.draw do
  root to: 'home#index'

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :rooms, only: :none do
    resources :weeks, only: :show do
      member do
        post 'schedule'
      end
    end
  end
end
