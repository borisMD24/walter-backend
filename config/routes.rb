Rails.application.routes.draw do
  resources :product_order_instances
  resources :order_instances
  resources :products
  resources :shops
  resources :orders
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
    namespace :api do
          resources :users
    end
    
end
