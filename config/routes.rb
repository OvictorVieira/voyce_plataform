Rails.application.routes.draw do

  root to: 'landing_page#index'

  namespace :guest do
    get '/auth/login', to: 'guests#index', as: 'auth_login'
    post '/access-account', to: 'guests#access_account'
  end

  namespace :dashboard do
    get '/', to: 'home#index'

    post 'auth/sign_out', to: 'home#sign_out', as: 'sign_out'

    # users
    get '/user/edit', to: 'users#edit', as: 'user_edit'
    post '/user/update', to: 'users#update', as: 'user_update'
    post '/user/become_artist', to: 'users#convert_user_to_artist', as: 'convert_user_to_artist'

    get '/proposals', to: 'proposals#index', as: 'proposals'
    get '/proposals/new', to: 'proposals#new', as: 'new_proposals'

    post '/proposals/create', to: 'proposals#create', as: 'create_proposals'
    get '/proposals/edit/:id', to: 'proposals#edit', as: 'edit_proposals'
    post '/proposals/update', to: 'proposals#update', as: 'update_proposals'

    get '/musics', to: 'musics#index', as: 'musics'
    get '/musics/new', to: 'musics#new', as: 'new_music'
    post '/musics/create', to: 'musics#create', as: 'create_music'
    get '/musics/edit/:id', to: 'musics#edit', as: 'edit_music'
    post '/musics/update', to: 'musics#update', as: 'update_music'
  end

end
