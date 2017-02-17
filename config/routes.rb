Rails.application.routes.draw do
  root to: 'entries#index'

  

  get 'entries/show'

  get 'entries/new'

  get 'entries/create'

  get 'entries/edit'

  get 'entries/update'

  get 'entries/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
