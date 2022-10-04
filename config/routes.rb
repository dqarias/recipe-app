Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users
  resources :foods, only: %i[index new create destroy]
  resources :recipes do
    resources :recipe_foods
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 
end
