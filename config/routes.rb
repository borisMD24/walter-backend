Rails.application.routes.draw do
  resources :timelines
  resources :theme_lights
  resources :themes
  resources :lights
  resources :rooms
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
    resources :shop
    post '/instruction/', to: 'instructions#create'
    mount ActionCable.server => '/cable'
end
