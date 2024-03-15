#Working Route before changes

Rails.application.routes.draw do
  root 'home#index'
  get 'payments/show'
  resources :products
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }
  get '/carts/:product_id/add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'
  get '/carts/:product_id/buy_now/', to: 'carts#buy_now', as: 'buy_now'
  get '/cart_items', to: 'carts#cart_items', as: 'cart_items'

  delete '/cart_items/:product_id', to: 'carts#remove_item_from_cart', as: 'cart_item'
  patch '/cart_items/:product_id/update_order_count', to: 'carts#update_order_count', as: 'update_order_count_cart_item'
  get 'verify_email/:token', to: 'users#verify_email', as: :verify_email

end

# new routes optimize version

# Rails.application.routes.draw do
#   root 'home#index'
#   get 'payments/show'

#   resources :products

#   devise_for :users, controllers: {
#     registrations: 'users/registrations',
#     sessions: 'users/sessions',
#     passwords: 'users/passwords',
#     confirmations: 'users/confirmations',
#     unlocks: 'users/unlocks'
#   }

#   resources :cart_items do
#     member do
#       post 'buy_now', to: 'cart_items#buy_now'
#       get 'cart_item', to: 'cart_items#cart_item', as: 'cart_item'
#       delete 'remove_from_cart', to: 'cart_items#remove_item_from_cart', as: 'remove_from_cart'
#       patch 'update_order_count', to:'cart_items#update_order_count', as: 'update_order_count'
#     end
#   end

#   get '/carts/:product_id/add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'
#   get '/carts/:product_id/buy_now/', to: 'carts#buy_now', as: 'buy_now'
#   get 'verify_email/:token', to: 'users#verify_email', as: :verify_email
# end
