Rails.application.routes.draw do
  post 'users' => 'users#new'

  get 'users' => 'users#show'

  get 'users/edit'

  get '' => 'sessions#new'
  get 'main' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  post 'main/logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
