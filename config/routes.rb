Rails.application.routes.draw do
  resources :artists, only: [:new, :create, :show, :index]
  resources :instruments, only: [:index, :show]
  get 'artists/:id/add_instrument', to: 'artists#add_instrument', as: 'add_instrument'
  post 'artists/:id/play_instrument', to: 'artists#play_instrument', as: 'play_instrument'
end
