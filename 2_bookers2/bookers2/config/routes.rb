Rails.application.routes.draw do
  # deviseモデルを作成したことで下記のルーティンングが自動追加
  # deviseを使用する際にURLとしてusersを含むことを示す
  devise_for :users

  # homesコントローラー
  root :to => 'homes#top'
  get "home/about" => "homes#about", as: "about"

  # booksコントローラー
  resources :books, only: [:index, :create, :show, :edit]

  # usersコントローラー
  resources :users, only: [:index, :show, :edit]




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
