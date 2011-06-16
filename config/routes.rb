Myauth::Application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "done" => "lists#done"
  get "undone" => "lists#undone"

  get "browsers/desktop"
  get "browsers/mobile"

  
  root :to => "pages#new"
  resources :users
  resources :sessions
  resources :lists
  resources :listqueries
  
end
