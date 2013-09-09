DavinciShoppingCart::Application.routes.draw do
  post 'line_items' => 'line_items#create'

  get "store" => "store#index"
  resources :products

  root 'store#index'
end
