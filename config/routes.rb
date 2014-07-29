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

    # Routing for API class from the app
  namespace :api, defaults: { format: :json } do
    namespace :v0 do
      # constraints ApiConstraints.new(version: 0, default: true) do
        resources :users, :only => [:index, :show, :create, :update, :destroy]
        match 'user/:email', to: 'users#show', via: [:get]
      # end
    end

    namespace :v1 do
      # constraints ApiConstraints.new(version: 1, default: false) do
        post 'signin', to: 'user#signin'
        post 'signup', to: 'user#signup'
      # end
    end
  end

end
