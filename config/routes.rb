Rails.application.routes.draw do

  root to: 'landing_page#index'

  namespace :guest do
    get '/login', to: 'guests#login'
  end

  namespace :dashboard do
    get '/home', to: 'home#index'
  end

end
