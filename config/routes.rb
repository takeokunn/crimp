Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#top"

  get '/gym_list', to:'gym_list#top'
  
  get "/gym/:id", to:"gyms#show"



end
