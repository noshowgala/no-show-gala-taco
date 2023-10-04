Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  resources :products, only: [:index]

  post 'donations/add_product', to: 'donations#add_product', as: :add_product
  post 'donations/remove_product', to: 'donations#remove_product', as: :remove_product
  post 'donations/checkout', to: 'donations#checkout', as: :checkout
  get 'donations/success', to: 'donations#success', as: :donations_success
end
