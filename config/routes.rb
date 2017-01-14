Rails.application.routes.draw do
  devise_for :users
  # rails g controllerでメソッドを指定した場合、ルーティングがgetのみになる(下記)
  # get 'customers/index'
  # get 'customers/new'
  # get 'customers/create'
  # get 'customers/edit'
  # get 'customers/update'
  # get 'customers/show'
  # get 'customers/destroy'
  
    resources :customers
    root 'customers#index'

  
end
