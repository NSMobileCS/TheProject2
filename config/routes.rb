Rails.application.routes.draw do
  get 'bright_ideas' => 'ideas#index'
  get 'bright_ideas/:id' => 'ideas#show'
  post 'bright_ideas' => 'ideas#create'
  post 'bright_ideas/:id/like' => 'ideas#like'
  post 'bright_ideas/:id/destroy' => 'ideas#destroy'
  post 'bright_ideas/unlike/:like_id' => 'ideas#unlike'

  post 'users' => 'users#new'
  get 'users/:id' => 'users#show'


  get '' => 'sessions#new'
  get 'main' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  post 'main/logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
