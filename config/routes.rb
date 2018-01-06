Rails.application.routes.draw do
  get 'users/new'

  get 'users' => 'users#show'

  get 'users/edit'

  get 'main' => 'sessions#new'
  get '' => 'sessions#new'
  post 'sessions' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
