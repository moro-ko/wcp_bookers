Rails.application.routes.draw do
  # homes#topをルートパスにせって
  root :to => 'homes#top'
  # get "/" => "home#top"
  
  get 'books' => 'books#index'
  
  get "books" => "books#new"
  
  post "books" => "books#create"

  get 'books/:id' => 'books#show'

  get 'books/:id/edit' => 'books#edit'

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
