Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :show] do
    resources :comments, only: :create
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
