Rails.application.routes.draw do
  resources :follows, only: [:create]
  resources :topics
  resources :answers
  resources :questions
  devise_for :users
  root 'home#index'
  get 'following' => 'home#following'
  get 'follow_topic' => 'home#follow_topic'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
