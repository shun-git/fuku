Rails.application.routes.draw do
  get 'qandas/new'
  get 'boards/new'
  get 'abouts/new'
  get 'users/new'

  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'

  resources :users
  resources :posts

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get "abouts/index" => "abouts#index"

  get "posts/new" => "posts#new"
  get "posts/index" => "posts#index"
  delete 'posts/:id' => 'posts#destroy'

  get "boards/index" => "boards#index"
  # root -> ルートパス(localhost:3000)でアクセスした場合に割り当てられる設定で、Controllerファイルに記述するindexメソッドを実行するように定義
  get 'boards', to: 'boards#index'
  # 投稿ページを表示
  get 'boards/new', to: 'boards#new'

  get "tests/index" => "tests#index"

  get "qandas/index" => "qandas#index"
end
