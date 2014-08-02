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
  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"


  namespace :api, defaults: { format: :json } do
    namespace :v0 do
        resources :users, :only => [:show, :create, :update]
        match 'user/:email', to: 'users#show', via: [:get]
        post 'sign_in', to: 'users#sign_in'
        post 'sign_up', to: 'users#sign_up'

      resources :goals, :only => [:create, :show]

    end
  end

end
