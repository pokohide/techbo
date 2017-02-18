Rails.application.routes.draw do
  root to: 'entries#index'

  resources :entries do
    resources :comments, only: [:create, :destroy]
    # collection do
    #   get 'tag/:tag_name'
    # end
  end

  devise_for :users

  #devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' },
  #                 controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'users/registrations' }

  get '/tags', to: 'entries#tag_cloud', as: 'tag_cloud'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/me/edit', to: 'users#edit', as: 'edit_user'
  put '/me', to: 'users#update', as: 'update_user'
  get '/me', to: 'users#me', as: 'me'
end
