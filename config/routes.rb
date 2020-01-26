Rails.application.routes.draw do
  resources :songs
  resources :events do
    resources :details
  end
  
  devise_for :users
  root "pages#index"
end
