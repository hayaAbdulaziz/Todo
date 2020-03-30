Rails.application.routes.draw do
  get 'todos/:id' , to: 'todos#show'
  get 'todos', to: 'todos#index'
  get 'pages/home'
  get 'about', to: 'pages#about'
  get 'pages/contact'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
