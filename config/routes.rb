#Working Route before changes

Rails.application.routes.draw do
  root 'home#index'
  get 'payments/show'
  resources :products
  resources :purchase_records
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  get '/show_orders', to: 'purchase_records#show_orders', as: 'show_orders_purchase_records'
  get '/buy_now/:product_id', to: 'buy_now#buy_now', as: 'buy_now'


  get '/cart_items', to: 'carts#cart_items', as: 'cart_items'
  post '/carts/:product_id/add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'
  delete '/cart_items/:product_id', to: 'carts#remove_item_from_cart', as: 'cart_item'
  patch '/cart_items/:product_id/update_order_count', to: 'carts#update_order_count', as: 'update_order_count_cart_item'
  
  get 'verify_email/:token', to: 'users#verify_email', as: :verify_email
  # get '/product_images/*path', to: 'product_images#show', format: false

end