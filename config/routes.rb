Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  match "/auth/:provider/callback" => "sessions#create", via: %i[get post]
  delete "/sign_out" => "sessions#destroy"

  resources :plugins do
    post :build, on: :collection
  end

  namespace :users do
    resources :plugins
  end
end
