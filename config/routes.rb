Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  get '/public_recipes', to: 'recipes#public_recipes'
  resources :users
  resources :foods, only: %i[index new create destroy]
  resources :recipes do
    resources :recipe_foods
    get '/recipes/add_food/', to: 'recipe_foods#add_food'
  end
end
