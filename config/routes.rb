Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#top"

  resources :gyms
  
  get "/gym/edit_f_info/:gym_id", to:"gyms#edit_f_info"
  get "/gym/edit_d_info/:gym_id", to:"gyms#edit_d_info"
  
end
