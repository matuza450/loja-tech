Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
  get "reviews/create"
  get "reviews/destroy"
  get "likes/toggle"
  get "comments/create"
  get "comments/destroy"
  root "pages#home"
  
  # Authentication routes
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # Cart routes
  resource :cart, only: [:show] do
    post 'add_item/:product_id', to: 'carts#add_item', as: :add_item
    delete 'remove_item/:item_id', to: 'carts#remove_item', as: :remove_item
  end
  
  resources :products do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
    post 'toggle_like', to: 'likes#toggle', on: :member
    # Route to remove a specific attached image from a product
    delete 'remove_image/:image_id', to: 'products#remove_image', as: :remove_image, on: :member
  end
  get "pages/home"
  get "privacy", to: "pages#privacy", as: :privacy
  
  # Health check and PWA routes
=======
  resources :products
  get "pages/home"
=======
  resources :products
  get "pages/home"
>>>>>>> parent of df2f121 (UPDATE)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
<<<<<<< HEAD
>>>>>>> parent of df2f121 (UPDATE)
=======
>>>>>>> parent of df2f121 (UPDATE)
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "pages#home"
  resources :products
  # Defines the root path route ("/")
  # root "posts#index"
end
