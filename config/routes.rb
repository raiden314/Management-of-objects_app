Rails.application.routes.draw do
  post "login" => "users#login"
  get "login" => "users#login_form"
  get "logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "users/signup" => "users#new"
  get 'users/index' => "users#index"
  get "users/:id" => "users#show"
  get "/" => 'home#top'
  get "about" => "home#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
