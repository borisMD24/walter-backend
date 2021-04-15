Rails.application.routes.draw do
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
      resources :articles
      resources :users
    end
    
end
