Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "pages#dashboard", as: :dashboard
  resources :stocks
  resources :wallets
  get "filter_wallets_search", to: "wallets#filter_wallets"
  get "filter_wallets_search/:name", to: "wallets#filter_wallets"
  get "filter_wallets_select/:limit", to: "wallets#filter_wallets"
end
