Rails.application.routes.draw do

  root to: 'landing_page#index'

  namespace :guest do
    get '/auth/login', to: 'guests#index'
    post '/access-account', to: 'guests#access_account'
  end

  namespace :dashboard do
    get '/', to: 'home#index'
  end

end
