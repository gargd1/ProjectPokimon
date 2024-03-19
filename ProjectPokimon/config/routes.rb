Rails.application.routes.draw do
  get 'members/show'
  root 'pokemons#index' 
  resources :pokemons, only: [:index, :show]
  get '/about', to: 'static_pages#about', as: 'static_pages_about'
  get "up" => "rails/health#show", as: :rails_health_check
  resources :members, only: [:show], controller: 'members'
end
