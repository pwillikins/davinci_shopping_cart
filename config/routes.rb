DavinciShoppingCart::Application.routes.draw do
  get "store" => "store#index"
  resources :products

  root 'store#index'
end
