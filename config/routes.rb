Rails.application.routes.draw do
  resources :non_recurring_expenses

  resources :recurring_expenses

  resources :goals

  devise_for :users, :controllers => {
    :omniauth_callbacks => :omniauth_callbacks,
    :registrations => "registrations"
  }

  root 'home#index'

  get 'dashboard/' => 'dashboard#index'
end
