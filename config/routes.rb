Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about", as: :about
  resources :stocks
  get "search", to: "stocks#search", as: :search
  resources :wallets, shallow: true do
    resources :wallet_stocks
  end

  resources :wallet_stocks, only: :delete
  resources :wallets
  get "filter_wallets_search", to: "wallets#filter_wallets"
  get "filter_wallets_search/:name", to: "wallets#filter_wallets"
  get "filter_wallets_select/:limit", to: "wallets#filter_wallets"
end
