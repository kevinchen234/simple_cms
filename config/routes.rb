Rails.application.routes.draw do
  # get "pages/index"
  # get "pages/show"
  # get "pages/new"
  # get "pages/edit"
  # get "pages/delete"
  # get "subjects/index"
  # get "subjects/show"
  # get "subjects/new"
  # get "subjects/edit"
  # get "subjects/delete"

  root "demo#index"

  get "demo/index"
  get "demo/hello"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "demo/about"
  get "demo/contact"

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
