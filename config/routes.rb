Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :movies do
    #resources :reservations, only: [:index]
    get "reservation", to: "movies#reservation"
    resources :schedules do
      resources :reservations, only: [:new, :create]
    end
  end

  namespace :admin do
    resources :movies do
      resources :schedules, only: [:new, :create]
    end
    resources :schedules, only: [:index, :show, :edit, :update, :destroy]
  end

  resources :sheets
end
