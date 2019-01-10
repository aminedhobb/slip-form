Rails.application.routes.draw do
  resources :answers, only: [:new, :create]
  resources :orders, only: [:create]
  get '/answers/accepted', to: 'answers#accepted'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
