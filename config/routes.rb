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
        resources :users, :only => [:show, :create, :update, :destroy]
        match 'user/:email', to: 'users#show', via: [:get]
        post 'signin', to: 'user#signin'
        post 'signup', to: 'user#signup'
    end
  end

end
