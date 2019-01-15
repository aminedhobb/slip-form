Rails.application.routes.draw do
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'
  resources :answers, only: [:new, :create]
  resources :orders, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
