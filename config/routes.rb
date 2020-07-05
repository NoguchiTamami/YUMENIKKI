Rails.application.routes.draw do
# devise
  devise_for :users
# Home Controller
  root  'homes#top'

 #Posts Controller
  resources :posts do
  resource :favorites, only: [:create, :destroy]
end
  
 #Users Controller
  resources :users, only: [:show, :edit, :update, :index, :new ]


end
