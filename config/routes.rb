Rails.application.routes.draw do
  get 'qandas/new'
  get 'boards/new'
  get 'abouts/new'
  get 'users/new'
  get 'posts/new'
  get 'posts/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  resources :users
  resources :posts
  resources :boards

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get "abouts/index" => "abouts#index"

  get "posts/new" => "posts#new"
  get "posts/index" => "posts#index"

  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  delete 'posts/:id' => 'posts#destroy'

  get "boards/index" => "boards#index"

  get "boards/:id/edit" => "boards#edit"
  post "boards/:id/update" => "boards#update"
  post "boards/:id/destroy" => 'boards#destroy'

  get "tests/index" => 'tests#index'

  get "qandas/index" => "qandas#index"

  get "contacts/index" => "contacts#index"

  get "sitemaps/index" => "sitemaps#index"
end
