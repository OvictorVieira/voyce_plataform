Rails.application.routes.draw do

  root to: 'landing_page#index'

  namespace :guest do
    get '/auth/login', to: 'guests#index'
    post '/access-account', to: 'guests#access_account'
  end

  namespace :dashboard do
    get '/', to: 'home#index'

    # users
    get '/user/edit', to: 'users#edit', as: 'user_edit'
    post '/user/update', to: 'users#update', as: 'user_update'
    post '/user/become_artist', to: 'users#convert_user_to_artist', as: 'convert_user_to_artist'
  end

end
