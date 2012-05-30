Shop::Application.routes.draw do
  devise_for :users

  root :to => 'home_pages#welcome'
  resources :cart_items, :only => [:create, :destroy]
  resources :orders, :only => :create do
     get :preview, :on => :member
   end
  match 'current_cart' => 'carts#show', :as => :current_cart
  match "checkout" => "orders#checkout", :as => :checkout
  match "confirm" => "orders#confirm", :as => :confirm
  match "complete" => "orders#complete", :as => :complete
  
  namespace :admin do
    root :to => 'products#index'
    resources :products
    resources :orders, :only => [:index, :show, :destroy]
  end
  
  as :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
    get "/register" => "devise/registrations#new"
  end
end
