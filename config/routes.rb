Rails.application.routes.draw do
  resources :songs
  resources :events do
    resources :details
  end
  
  devise_for :users
  root "pages#index"

  namespace :api do
    namespace :v1 do
      resources :songs, only: [:index]
      resources :events, only: [:index]
    end
  end

  get '*path', controller: 'application', action: 'render_404'
end
