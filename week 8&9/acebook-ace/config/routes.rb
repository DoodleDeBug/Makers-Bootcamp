Rails
  .application
  .routes
  .draw do
    root to: 'main#index'
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'
    post 'log_in', to: 'main#create'
    delete 'logout', to: 'main#destroy'

    resources :post_images do
      resources :comments
      resources :likes
    end

    resources :messages
    resources :rooms
  end
