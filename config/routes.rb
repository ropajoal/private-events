Rails.application.routes.draw do
  get 'attendee_event/create'
  devise_for :users
  get '/users/:id', to: 'users#show'
  post '/attendee_event/', to:'attendee_event#create'
  resources :events, only: [:index, :show, :new, :create]
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
