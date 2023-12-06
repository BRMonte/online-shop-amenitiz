Rails.application.routes.draw do
  get 'pages/manage_items', as: 'manage_items'
  resources :items
  resources :order_items
  resources :carts, only: %i[show]

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'items#index'
end
