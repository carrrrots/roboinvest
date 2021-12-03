Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard", as: :dashboard
  resources :stocks
  get "search", to: "stocks#search", as: :search
  resources :wallets, shallow: true do
    resources :wallet_stocks
  end

  resources :wallet_stocks, only: :delete
end
