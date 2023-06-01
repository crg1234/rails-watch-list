Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create] do
      resources :movies, only: [:show]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  # get 'lists', to: 'lists#index'
  # get 'lists/new', to: 'lists#new', as: :new_list
  # get 'lists/:id', to: 'lists#show', as: :list
  # post 'lists', to: 'lists#create'
end
