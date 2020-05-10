Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  get "home/contact"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post_studys do
    resource :post_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end
  resources :users , only:[:show, :edit, :update]
end
