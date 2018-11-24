Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  resources :gyms do
    resources :posts do
      resource :post_likes, only: %i[create destroy]
    end
    resource :gym_likes, only: %i[create destroy]
    resource :home_gym, only: %i[create destroy new], as: :home
  end
end