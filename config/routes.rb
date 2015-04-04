Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  devise_for :pokemons
  resources :pokemons
  patch "capture", to: "pokemons#capture", as: :capture
  patch "damage", to: "pokemons#damage", as: :damage 
end
