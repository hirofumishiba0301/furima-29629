Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items,only:[:new,:create] do
    resources :orders,only:[:new,:create]
  end
end
