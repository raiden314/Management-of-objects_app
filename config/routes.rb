Rails.application.routes.draw do
  get 'posts/index'
  post "login" => "users#login"
  get "login" => "users#login_form"
  get "logout" => "users#logout"
  get 'users/index' => "users#index"
  get "users/signup" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  get "/" => 'home#top'
  get "about" => "home#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
