Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#top"

  resources :gyms
  
  get "gyms/:id/edit_f_info", to:"gyms#edit_f_info"
  get "gyms/:id/edit_d_info", to:"gyms#edit_d_info"
  
end
