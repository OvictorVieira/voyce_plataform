Rails.application.routes.draw do

  root to: 'guest#index'

  namespace :guest do
    get '/login', to: 'guest#login'
  end

  namespace :dashboard do
    get '/home', to: 'home#index'
  end

end
