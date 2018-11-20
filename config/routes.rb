Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#top"

  resources :gyms do
    resources :posts

    member do
      get 'like', to:"gyms#like", as: :like
    end
  end

end
