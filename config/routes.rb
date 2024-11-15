Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :plugins do
    post :build, on: :collection
  end

  namespace :users do
    resources :plugins
  end
end
