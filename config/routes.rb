Rails.application.routes.draw do

  root to: 'authentication#index'

  get '/login', to: 'authentication#login'

  namespace :dashboard do

  end

end
